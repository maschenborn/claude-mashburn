---
name: cloudinary
description: Manage Cloudinary media assets via CLI and SDK. Use when the user asks to "upload to cloudinary", "sync images", "manage assets", "cloudinary search", "generate cloudinary URL", "optimize images", "list cloudinary resources", "cloudinary transformation", or any Cloudinary media management task. Also triggers on "upload images", "media assets", "image optimization", or "CDN images" when the project uses Cloudinary. Prefer the cld CLI for interactive operations and the Node.js SDK for programmatic access.
---

# Cloudinary Management

Manage media assets via the Cloudinary CLI (`cld`) and Node.js SDK. The CLI is preferred for interactive operations — it's faster, uses fewer tokens, and provides direct terminal output.

## Credentials

### CLOUDINARY_URL Format

```
cloudinary://API_KEY:API_SECRET@CLOUD_NAME
```

Get this from: Cloudinary Console → Settings → API Keys

### Where to Store

| Location | Purpose |
|----------|---------|
| **Project `.env.local`** | For app runtime (Next.js, Node.js, etc.) |
| **`~/.zshrc` or shell profile** | For global CLI access across all projects |
| **`cld config`** | For CLI-specific named configurations |

### Named CLI Configurations

```bash
# Save a named config (useful for multiple Cloudinary accounts):
cld config -n projectname cloudinary://KEY:SECRET@CLOUD

# List saved configs:
cld config -ls

# Use a specific config for a command:
cld -C projectname admin resources
```

## CLI Reference (`cld`)

### Quick Reference

| Command | Purpose |
|---------|---------|
| `cld admin` | Admin API — list resources, folders, transformations, usage |
| `cld uploader` | Upload API — upload, rename, destroy, explicit, tags |
| `cld search` | Search assets with expression syntax |
| `cld sync` | Sync local folder ↔ Cloudinary folder |
| `cld upload_dir` | Upload entire directory maintaining structure |
| `cld make` | Generate transformation URLs interactively |
| `cld url` | Generate delivery URLs |
| `cld config` | Manage CLI configurations |

### Common Operations

#### List Resources
```bash
cld admin resources resource_type=image max_results=30
cld admin resources type=upload prefix="products/" max_results=50
cld admin resources_by_tag hero_images
```

#### Upload
```bash
cld uploader upload "photo.jpg" public_id="products/photo1" folder="products"
cld uploader upload "photo.jpg" public_id="thumb" eager="w_200,h_200,c_fill"
cld upload_dir "./assets/images" --folder "website"
```

#### Search
```bash
cld search "filename:hero*"
cld search "folder:products/*"
cld search "format:jpg AND bytes>1000000"
cld search "tags:featured"
cld search "uploaded_at>1w" sort_by="uploaded_at" direction=desc
```

#### Sync (bidirectional)
```bash
cld sync --push ./local-folder cloudinary-folder
cld sync --pull cloudinary-folder ./local-folder
cld sync --push -K ./local-folder cloudinary-folder
```

#### Delete
```bash
cld uploader destroy "public_id"
cld admin delete_resources_by_prefix "old-folder/"
```

#### Generate URLs
```bash
cld url "sample.jpg" --transformation "f_auto,q_auto"
cld url "products/hero.jpg" --transformation "w_800,h_600,c_fill,f_auto,q_auto"
```

## Node.js SDK (Fallback)

When the CLI is unavailable or you need programmatic access:

```javascript
import { v2 as cloudinary } from 'cloudinary';

// Auto-configures from CLOUDINARY_URL env var
cloudinary.config();

// Upload
const result = await cloudinary.uploader.upload('photo.jpg', {
  folder: 'products',
  public_id: 'hero',
});

// Search
const searchResult = await cloudinary.search
  .expression('folder:products AND format:jpg')
  .sort_by('created_at', 'desc')
  .max_results(30)
  .execute();

// Generate URL
const url = cloudinary.url('products/hero', {
  transformation: [
    { width: 800, height: 600, crop: 'fill' },
    { fetch_format: 'auto', quality: 'auto' },
  ],
});
```

## Next.js Integration (next-cloudinary)

```bash
npm install next-cloudinary
```

```env
# .env.local
NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME=your_cloud
CLOUDINARY_API_KEY=your_key
CLOUDINARY_API_SECRET=your_secret
```

```tsx
import { CldImage, CldUploadWidget } from 'next-cloudinary';

<CldImage src="products/hero" width={800} height={600} crop="fill" />
```

## Choosing the Right Tool

| Scenario | Use |
|----------|-----|
| Quick upload, search, list, delete | `cld` CLI |
| Sync local ↔ remote folder | `cld sync` |
| App runtime (upload, transform, deliver) | Node.js SDK or next-cloudinary |
| Next.js image delivery | `next-cloudinary` package |

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D77327F4C3B
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Nov 2023 17:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E618710E687;
	Wed, 22 Nov 2023 16:20:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA7610E687;
 Wed, 22 Nov 2023 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EoeKWmvDXudVDgBjqkb0Elm6Q/W5MOXGYpVoR+3DovU=; b=kBl4FtPD7uxqELbnBF1EFvRV+a
 h0XRGQqlyMOEtK3X2w9uqu8OrBIb3VOBJVfkG1HK44qZqg6atuvWUtKcNYRmphjdwmcsMGCn2rwcQ
 OnhSTQ37w9l0hfbx/xPtVeOa3am3Hp9d3JskkauIkxltgk8fpUYk38plfJ7zbzVEGQw0lcizZj0Uu
 kgGWGUMTUrgNQWYlE/q+ljulSs0gW54d35L8/owlE4+6z7i/I6gCVTljfQAM8yKAljGXE4HgASUW1
 GpRh3uDWGZnXvWj/oKfwBn5Moa+z4PHxhVY4EtLTS1P7yjiT1AeBenhjt3lYySY8UNrd+oU6Eq3BD
 ntc26zpg==;
Received: from 189-69-166-209.dial-up.telesp.net.br ([189.69.166.209]
 helo=steammachine.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r5pxy-0061lT-2B; Wed, 22 Nov 2023 17:20:42 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Date: Wed, 22 Nov 2023 13:19:40 -0300
Message-ID: <20231122161941.320564-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122161941.320564-1-andrealmeid@igalia.com>
References: <20231122161941.320564-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, daniel@ffwll.ch,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>, Rob Clark <robdclark@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

This new kernel capability indicates whether async page-flips are
supported via the atomic uAPI. DRM clients can use it to check
for support before feeding DRM_MODE_PAGE_FLIP_ASYNC to the kernel.

Make it clear that DRM_CAP_ASYNC_PAGE_FLIP is for legacy uAPI only.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v9: no changes
---
---
 drivers/gpu/drm/drm_ioctl.c |  4 ++++
 include/uapi/drm/drm.h      | 10 +++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 44fda68c28ae..f461ed862480 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -301,6 +301,10 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
 		req->value = 1;
 		break;
+	case DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP:
+		req->value = drm_core_check_feature(dev, DRIVER_ATOMIC) &&
+			     dev->mode_config.async_page_flip;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 8662b5aeea0c..796de831f4a0 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -713,7 +713,8 @@ struct drm_gem_open {
 /**
  * DRM_CAP_ASYNC_PAGE_FLIP
  *
- * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for legacy
+ * page-flips.
  */
 #define DRM_CAP_ASYNC_PAGE_FLIP		0x7
 /**
@@ -773,6 +774,13 @@ struct drm_gem_open {
  * :ref:`drm_sync_objects`.
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
+/**
+ * DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
+ *
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for atomic
+ * commits.
+ */
+#define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
-- 
2.42.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08264441C5
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Nov 2021 13:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BDE7348E;
	Wed,  3 Nov 2021 12:42:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E8A8828E
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Nov 2021 12:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635942511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lDu7V2UPes5WjN4f5IhHpRndmxXdgV1k4QHUorLyZaY=;
 b=Q31US0TDp7NJ+SVm3GcvQbNyDLxlkjjDI1jk1Kvf24K+Tm9P0/3dyfy/AysAAu/nWyy/bh
 P1t6Q6FpQwVQlWJOtfQgJ5+ULAJ4GmtyS7Qlq2d5EGhAZCbmhKhFWKf/RNj7yXomy2UN3/
 k1zVWinFFy9YtmH1Ub2yp26eOOGXZdo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-jr3vCDpcPZG4utCWFmC1WA-1; Wed, 03 Nov 2021 08:28:28 -0400
X-MC-Unique: jr3vCDpcPZG4utCWFmC1WA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so1008790wmh.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Nov 2021 05:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lDu7V2UPes5WjN4f5IhHpRndmxXdgV1k4QHUorLyZaY=;
 b=ipMddGMqPu7hzDBoIlJdwb3YqQ4r4d+lOW+x586hJ4ZIUsD3y+buLa1ru3NDP4w8Iw
 ctG4HIcECcnFGx/cw2h/XzLT1L94TUGfO5wXy0pzAgLE04nsTM/p5g2dmy82uXntfG3x
 RiMTgrfixX05c7guTHBicM+lWjZZe7e6KlZgqsYc+gAjciXE5cQ4ryp19Zit2Yk3U5sr
 BtFOgPC2cblAEfXhOljdpbABg6A+/OobeqMn0I6nBJ6pdtuYqKh/lBhIIpfy/9DC9xtB
 i2iyVa4GyoF/1rWXf9ZjDQDUYsP8AS/iWhLvmFSDlglu9k2vXuNbrNMT88c171gwbfZO
 B32w==
X-Gm-Message-State: AOAM531Fxdz9+O5bnvVAla3e1+YpyZq+fLtY7oUEq2H0b0MfpuPPeTZJ
 SAZ2MpGONIllCv/kasFaONkOYly9qFzUkQq2VbyvenhXljlxcY2UFT2TMN6sme2dE+p5VJ11XCT
 syrzID1WaJUhomGyB8Hek3zHTYA==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr56180969wrc.231.1635942507379; 
 Wed, 03 Nov 2021 05:28:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoKFRYs4+FwUh+L5HYY422zuSq9cxsugE+p23YKU/J7QO0nbcMQx6cOjsOctL5eIXzrrPWjA==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr56180921wrc.231.1635942507148; 
 Wed, 03 Nov 2021 05:28:27 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id w7sm1868400wru.51.2021.11.03.05.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 05:28:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/5] Cleanups for the nomodeset kernel command line
 parameter logic
Date: Wed,  3 Nov 2021 13:28:04 +0100
Message-Id: <20211103122809.1040754-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Nov 2021 12:42:48 +0000
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[ resend with all relevant people as Cc now, sorry to others for the spam ]

There is a lot of historical baggage on this parameter. It's defined in
the vgacon driver as a "nomodeset" parameter, but it's handler function is
called text_mode() that sets a variable named vgacon_text_mode_force whose
value is queried with a function named vgacon_text_force().

All this implies that it's about forcing text mode for VGA, yet it is not
used in neither vgacon nor other console driver. The only users for these
are DRM drivers, that check for the vgacon_text_force() return value to
determine whether the driver could be loaded or not.

That makes it quite confusing to read the code, because the variables and
function names don't reflect what they actually do and also are not in the
same subsystem as the drivers that make use of them.

This patch-set attempts to cleanup the code by moving the nomodseset param
to the DRM subsystem and do some renaming to make their intention clearer.

There is also another aspect that could be improved, and is the fact that
drivers are checking for the nomodeset being set as an indication if have
to be loaded.

But there may be other reasons why this could be the case, so it is better
to encapsulate the logic in a separate function to make clear what's about.

Patch #1 is just a trivial fix for a comment that isn't referring to the
correct kernel parameter.

Patch #2 moves the nomodeset logic to the DRM subsystem.

Patch #3 renames the vgacon_text_force() function and accompaning logic as
drm_modeset_disabled(), which is what this function is really about.

Patch #4 adds a drm_drv_enabled() function that could be used by drivers
to check if could be enabled.

Patch #5 uses the drm_drv_enabled() function to check this instead of just
checking if nomodeset has been set.


Javier Martinez Canillas (5):
  drm/i915: Fix comment about modeset parameters
  drm: Move nomodeset kernel parameter handler to the DRM subsystem
  drm: Rename vgacon_text_force() function to drm_modeset_disabled()
  drm: Add a drm_drv_enabled() helper function
  drm: Use drm_drv_enabled() instead of drm_modeset_disabled()

 drivers/gpu/drm/Makefile                |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  5 ++---
 drivers/gpu/drm/ast/ast_drv.c           |  3 +--
 drivers/gpu/drm/drm_drv.c               | 21 ++++++++++++++++++++
 drivers/gpu/drm/drm_nomodeset.c         | 26 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_module.c      | 10 +++++-----
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  3 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  3 +--
 drivers/gpu/drm/qxl/qxl_drv.c           |  3 +--
 drivers/gpu/drm/radeon/radeon_drv.c     |  3 +--
 drivers/gpu/drm/tiny/bochs.c            |  3 +--
 drivers/gpu/drm/tiny/cirrus.c           |  3 +--
 drivers/gpu/drm/vboxvideo/vbox_drv.c    |  5 +----
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  3 +--
 drivers/video/console/vgacon.c          | 21 --------------------
 include/drm/drm_drv.h                   |  1 +
 include/drm/drm_mode_config.h           |  6 ++++++
 include/linux/console.h                 |  6 ------
 19 files changed, 73 insertions(+), 57 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_nomodeset.c

-- 
2.33.1


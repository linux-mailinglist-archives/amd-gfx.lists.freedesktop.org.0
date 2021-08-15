Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A163ECAAC
	for <lists+amd-gfx@lfdr.de>; Sun, 15 Aug 2021 21:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0B89C9B;
	Sun, 15 Aug 2021 19:30:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D6B89CDE;
 Sun, 15 Aug 2021 19:30:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D0C56128C;
 Sun, 15 Aug 2021 19:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629055815;
 bh=UhBKLUcdJ1zu42LR19pbmuCkunq5UG7fIdg4noAlaU4=;
 h=From:To:Cc:Subject:Date:From;
 b=IZ4845d4es+z3S7jXQQ218oKwi1Tw76QQ9IuZhDj0qE8YXGO3vimVjBmgUMMInEj+
 OqSBuk6Y++vqhBZdl8rbOUoG43hCeWABVHQelEXkJZcywK8sxHK9VuVu+cSUehxRip
 Ozttm6N6Mexu1zhimW2OgUltA7XHX8aBjyyxCe82duVj0svsbabsiRqdj5nA0kJowc
 yry2PpT4U3BaeYPSQn7uCNc8G4cEDKQIQLYxGrEhKCBDWMBiWDJ0Nd0dJRCHqrXIWp
 AwnvLTkCYSTU1G1sGkM+qt8LK2Q0b8yJHu3eDOEmXuasI2WrInGAfQNUHDzkuT8OGB
 qKfZRBnkuR2WQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] drm/radeon: Add break to switch statement in
 radeonfb_create_pinned_object()
Date: Sun, 15 Aug 2021 12:29:59 -0700
Message-Id: <20210815192959.90142-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Clang + -Wimplicit-fallthrough warns:

drivers/gpu/drm/radeon/radeon_fb.c:170:2: warning: unannotated
fall-through between switch labels [-Wimplicit-fallthrough]
        default:
        ^
drivers/gpu/drm/radeon/radeon_fb.c:170:2: note: insert 'break;' to avoid
fall-through
        default:
        ^
        break;
1 warning generated.

Clang's version of this warning is a little bit more pedantic than
GCC's. Add the missing break to satisfy it to match what has been done
all over the kernel tree.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index 0b206b052972..c8b545181497 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -167,6 +167,7 @@ static int radeonfb_create_pinned_object(struct radeon_fbdev *rfbdev,
 		break;
 	case 2:
 		tiling_flags |= RADEON_TILING_SWAP_16BIT;
+		break;
 	default:
 		break;
 	}

base-commit: ba31f97d43be41ca99ab72a6131d7c226306865f
-- 
2.33.0.rc2


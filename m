Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D7405B92
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Sep 2021 18:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451156E8A2;
	Thu,  9 Sep 2021 16:56:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB24B6E8A2
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Sep 2021 16:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 5468420201C;
 Thu,  9 Sep 2021 18:56:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QLtfJSUpHthf; Thu,  9 Sep 2021 18:56:29 +0200 (CEST)
Received: from kaveri (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id EE66220201A;
 Thu,  9 Sep 2021 18:56:28 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.95-RC2)
 (envelope-from <michel@daenzer.net>) id 1mONLg-0085Kw-IK;
 Thu, 09 Sep 2021 18:56:28 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Guchun Chen <guchun.chen@amd.com>, Lyude Paul <lyude@redhat.com>,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Drop inline from
 amdgpu_ras_eeprom_max_record_count
Date: Thu,  9 Sep 2021 18:56:28 +0200
Message-Id: <20210909165628.1927131-1-michel@daenzer.net>
X-Mailer: git-send-email 2.33.0
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Michel Dänzer <mdaenzer@redhat.com>

This was unusual; normally, inline functions are declared static as
well, and defined in a header file if used by multiple compilation
units. The latter would be more involved in this case, so just drop
the inline declaration for now.

Fixes compile failure building for ppc64le on RHEL 8:

In file included from ../drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h:32,
                 from ../drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:33:
../drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c: In function ‘amdgpu_ras_recovery_init’:
../drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h:90:17: error: inlining failed in call
 to ‘always_inline’ ‘amdgpu_ras_eeprom_max_record_count’: function body not available
   90 | inline uint32_t amdgpu_ras_eeprom_max_record_count(void);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1985:34: note: called from here
 1985 |         max_eeprom_records_len = amdgpu_ras_eeprom_max_record_count();
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# The function is called amdgpu_ras_eeprom_get_record_max_length on
# stable branches
Fixes: c84d46707ebb "drm/amdgpu: validate bad page threshold in ras(v3)"
Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 194590252bb9..210f30867870 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -756,7 +756,7 @@ int amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
 	return res;
 }
 
-inline uint32_t amdgpu_ras_eeprom_max_record_count(void)
+uint32_t amdgpu_ras_eeprom_max_record_count(void)
 {
 	return RAS_MAX_RECORD_COUNT;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
index f95fc61b3021..6bb00578bfbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
@@ -120,7 +120,7 @@ int amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
 int amdgpu_ras_eeprom_append(struct amdgpu_ras_eeprom_control *control,
 			     struct eeprom_table_record *records, const u32 num);
 
-inline uint32_t amdgpu_ras_eeprom_max_record_count(void);
+uint32_t amdgpu_ras_eeprom_max_record_count(void);
 
 void amdgpu_ras_debugfs_set_ret_size(struct amdgpu_ras_eeprom_control *control);
 
-- 
2.33.0


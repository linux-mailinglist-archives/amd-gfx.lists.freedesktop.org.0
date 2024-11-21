Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0309D518A
	for <lists+amd-gfx@lfdr.de>; Thu, 21 Nov 2024 18:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5318110E9F1;
	Thu, 21 Nov 2024 17:23:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC9410E9F4
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 Nov 2024 17:23:03 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 4ALHMw8v2677526; Thu, 21 Nov 2024 22:52:58 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 4ALHMw2g2677525;
 Thu, 21 Nov 2024 22:52:58 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 3/8] drm/amdgpu: Fix comment for
 vcn_v4_0_3_set_powergating_state
Date: Thu, 21 Nov 2024 22:52:45 +0530
Message-Id: <20241121172250.2677489-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121172250.2677489-1-sunil.khatri@amd.com>
References: <20241121172250.2677489-1-sunil.khatri@amd.com>
MIME-Version: 1.0
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

add vcn_v4_0_3_set_powergating_state ip_block comment and
clean up the argument "handle" comment.

This fixes the warning:
warning: Function parameter or struct member 'ip_block' not described in 'vcn_v4_0_3_set_powergating_state'
warning: Excess function parameter 'handle' description in 'vcn_v4_0_3_set_powergating_state'

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 04a18aadad61..ee041cf7adcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -1648,7 +1648,7 @@ static int vcn_v4_0_3_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 /**
  * vcn_v4_0_3_set_powergating_state - set VCN block powergating state
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: IP Block for specific IP type
  * @state: power gating state
  *
  * Set VCN block powergating state
-- 
2.34.1


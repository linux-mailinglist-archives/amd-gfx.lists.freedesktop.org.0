Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93F627F385
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Sep 2020 22:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8B189CCB;
	Wed, 30 Sep 2020 20:46:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from services.gouders.net (services.gouders.net [141.101.32.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DFC6E821
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Sep 2020 20:15:44 +0000 (UTC)
Received: from localhost (ltea-047-066-024-155.pools.arcor-ip.net
 [47.66.24.155]) (authenticated bits=0)
 by services.gouders.net (8.14.8/8.14.8) with ESMTP id 08UKDTXo012906
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 22:13:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
 t=1601496810; bh=nbpVWczMKXUHrhJcmLicD7YzKPBTHReBM4qXyPiYXcw=;
 h=From:To:Cc:Cc:Subject:Date;
 b=ucSkaD41prDSKeFK9qaYPUxF+lef3JueHF0Pl1PKO8aHsuafQwxGLCJX/Ao6d2EA2
 5fAQEyRpcmP/4LZPEfM6OVlA3PZoVzff6FJAfCeOOzQ2rPmeBe0ZC5DUfpo2HLafn5
 OHdW5j5RFOmWjHWfu8bx/BIrXjLp+MJm5hv0MHRI=
From: Dirk Gouders <dirk@gouders.net>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: BUG: amdgpu: NULL pointer dereference introduced in 5.9-rc1
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 30 Sep 2020 22:13:23 +0200
Message-ID: <ghmu1758gs.fsf@gouders.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 30 Sep 2020 20:46:52 +0000
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
Cc: Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Commit c1cf79ca5ced46 (drm/amdgpu: use IP discovery table for renoir)
introduced a NULL pointer dereference when booting with
amdgpu.discovery=0.

For amdgpu.discovery=0 that commit effectively removed the call of
vega10_reg_base_init(adev), so I tested the correctness of the bisect
session by restoring that function call for amdgpu_discovery == 0 and with
that change, the NULL pointer dereference does not occur:

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 84d811b6e48b..2e93c5e1e7e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -699,7 +699,8 @@ static void soc15_reg_base_init(struct amdgpu_device *adev)
                                         "fallback to legacy init method\n");
                                vega10_reg_base_init(adev);
                        }
-               }
+               } else
+                       vega10_reg_base_init(adev);
                break;
        case CHIP_VEGA20:
                vega20_reg_base_init(adev);

Dirk
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

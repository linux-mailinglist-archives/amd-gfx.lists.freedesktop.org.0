Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFFAB28F2C
	for <lists+amd-gfx@lfdr.de>; Sat, 16 Aug 2025 17:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141A10E114;
	Sat, 16 Aug 2025 15:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ALgiztSy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD7C10E114
 for <amd-gfx@lists.freedesktop.org>; Sat, 16 Aug 2025 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=awc/nXqb2/dElFi5cRnUj9mPf1XZGZek1/gkfhHF1i4=; b=ALgiztSyvUSZFd6wYoL0TAQu51
 cEHL0JBvlskFr24ZUfSLc0eb4U3Wp+JSxkihUW8W7wecREt2S5MHU6+hcuwUml27REvx5m3nzI5c3
 pHha0Sjp44H3SQXK1mFbuK+8VJ3dKlCwfMflhCa1Ztr2rA7ZqC5bjEJP7i00PVdCOrOx5Fhl7ccxe
 H+wJsroGE825Uz5+skwU97e7kZJIbW6ZqJKtPsEB0OPssr5E/Wx55Se5Uv4dWlunFLPAj8Hw+KyPV
 lIfkH6uq6GG5riR7bWID0hCBlQu5zdkehI9h1LhNY5i2cFVJB7Vo/lvc7Lf8Pta9zBiNvsNbjdKyG
 TZBc/Ehw==;
Received: from [104.193.135.201] (helo=debian.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1unIuu-00F9aY-CW; Sat, 16 Aug 2025 17:34:00 +0200
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 0/5] Expand kernel-doc with more generic details and info
 about ring buffers
Date: Sat, 16 Aug 2025 09:31:37 -0600
Message-ID: <20250816153315.1285182-1-siqueira@igalia.com>
X-Mailer: git-send-email 2.47.2
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

Lately, I have been part of multiple discussions around GPU recovery and
other concepts associated with GFX/Compute. Most of the debate is spread
around GitLab issues, emails, and some meeting conversations. This
patchset aims to consolidate all that information into a single
kernel-doc, which can be collaboratively improved and shared with other
people. 

In this series, you will find new amdgpu glossary entries, more details
about the IPs' interconnections, and a description of the ring buffer.
This series includes multiple SVG diagrams; for this reason, it might be
good to apply this series locally.

Finally, keep in mind that I tried to fill in some gaps between
information, and hopefully, my description matches the reality.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Timur Kristóf <timur.kristof@gmail.com>

Thanks

Rodrigo Siqueira (5):
  drm/amdgpu: Expand kernel-doc in amdgpu_ring
  Documentation/gpu: Add new glossary entries from UMR
  Documentation/gpu: Expand generic block information
  Documentation/gpu: Add more information about GC
  Documentation/gpu: Add documentation about ring buffer

 .../gpu/amdgpu/amd_overview_block.svg         |  674 +++++++
 Documentation/gpu/amdgpu/amdgpu-glossary.rst  |   24 +
 Documentation/gpu/amdgpu/driver-core.rst      |   25 +
 .../gpu/amdgpu/enforce_isolation.svg          |  707 +++++++
 Documentation/gpu/amdgpu/gc/cu.svg            |  437 +++++
 Documentation/gpu/amdgpu/gc/index.rst         |   28 +-
 Documentation/gpu/amdgpu/gfx_pipeline_seq.svg |  413 +++++
 Documentation/gpu/amdgpu/index.rst            |    1 +
 .../gpu/amdgpu/no_enforce_isolation.svg       |  673 +++++++
 Documentation/gpu/amdgpu/ring-buffer.rst      |   94 +
 Documentation/gpu/amdgpu/ring_buffers.svg     | 1633 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |    2 +
 13 files changed, 4717 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/amd_overview_block.svg
 create mode 100644 Documentation/gpu/amdgpu/enforce_isolation.svg
 create mode 100644 Documentation/gpu/amdgpu/gc/cu.svg
 create mode 100644 Documentation/gpu/amdgpu/gfx_pipeline_seq.svg
 create mode 100644 Documentation/gpu/amdgpu/no_enforce_isolation.svg
 create mode 100644 Documentation/gpu/amdgpu/ring-buffer.rst
 create mode 100644 Documentation/gpu/amdgpu/ring_buffers.svg

-- 
2.47.2


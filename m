Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E1BF3458
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Oct 2025 21:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94C210E4DF;
	Mon, 20 Oct 2025 19:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bj15wcQ0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90DD10E4D1
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Oct 2025 19:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hL55tZPuyCGgVdElAa7yjtKrT2cowZ+oEHDj3ymswME=; b=bj15wcQ0562ya/Xa7xDySmT/jA
 C+9vkrxxdys4JlsYXDBdlEPLuuIYQ16ozXSUYmouEnhsPX96HsQHfS/7CvRiuSxBHn4sEJk5788ZZ
 aPAaMgbKlGaXTJy2LweE0/1sYG/SJoNAtwrhwInX1qsSJ1i3PZ5c9mLyXK6KGqk7+lwGZ/ACVrUML
 hJOHomKBIO6adZnPxM1tbw/yQDq9ElDaXdauF51CoRP2BmkKG5BLwt9ZY3KhMpK3iwRj+xrtvV5rK
 zwJLL25k4F8+NOKt8lryX/eqJWzaeNpEweDjLq40lI+QhOOeDl6c6RqQ2P+z16dUKsz4CLyI5LlfT
 ezsBy5YA==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14]
 helo=debian.home.app) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vAvqb-00CEgQ-KM; Mon, 20 Oct 2025 21:47:14 +0200
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH v3 0/5] Expand kernel-doc with more generic details and info
 about ring buffers
Date: Mon, 20 Oct 2025 13:38:31 -0600
Message-ID: <20251020194631.102260-1-siqueira@igalia.com>
X-Mailer: git-send-email 2.51.0
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
good to apply this series locally. However, if you want to check all the
images quickly, check the links below:

- https://people.igalia.com/siqueira/kernel-doc-imgs/v3/amd_overview_block.svg
- https://people.igalia.com/siqueira/kernel-doc-imgs/v3/gfx_pipeline_seq.svg
- https://people.igalia.com/siqueira/kernel-doc-imgs/v3/no_enforce_isolation.svg
- https://people.igalia.com/siqueira/kernel-doc-imgs/v3/enforce_isolation.svg
- https://people.igalia.com/siqueira/kernel-doc-imgs/v3/ring_buffers.svg

Finally, keep in mind that I tried to fill in some gaps between
information, and hopefully, my description matches the reality.

Changes since V2:
 - Remove the unnecessary diagram.
 - Remove the excessive details about hardware behavior that are not
   useful for a driver developer.
 - Remove some wrong information.
 - Rewrite many parts of the ring buffer description.

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
 .../gpu/amdgpu/enforce_isolation.svg          |  654 +++++++
 Documentation/gpu/amdgpu/gc/index.rst         |   24 +-
 Documentation/gpu/amdgpu/gfx_pipeline_seq.svg |  413 +++++
 Documentation/gpu/amdgpu/index.rst            |    1 +
 .../gpu/amdgpu/no_enforce_isolation.svg       |  707 +++++++
 Documentation/gpu/amdgpu/ring-buffer.rst      |   91 +
 Documentation/gpu/amdgpu/ring_buffers.svg     | 1633 +++++++++++++++++
 Documentation/gpu/amdgpu/userq.rst            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |    2 +
 13 files changed, 4251 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/amd_overview_block.svg
 create mode 100644 Documentation/gpu/amdgpu/enforce_isolation.svg
 create mode 100644 Documentation/gpu/amdgpu/gfx_pipeline_seq.svg
 create mode 100644 Documentation/gpu/amdgpu/no_enforce_isolation.svg
 create mode 100644 Documentation/gpu/amdgpu/ring-buffer.rst
 create mode 100644 Documentation/gpu/amdgpu/ring_buffers.svg

-- 
2.51.0


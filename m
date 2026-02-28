Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO/qCxezomlc5AQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 28 Feb 2026 10:19:19 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8EE1C1A79
	for <lists+amd-gfx@lfdr.de>; Sat, 28 Feb 2026 10:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35E910E245;
	Sat, 28 Feb 2026 09:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gq1rNC97";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2EE10E1D8
 for <amd-gfx@lists.freedesktop.org>; Sat, 28 Feb 2026 01:12:32 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-c6e248aa446so1066007a12.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Feb 2026 17:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772241151; x=1772845951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aaPoQfadeqAcC/F2pMAhUC8silyGRKBmTmyeCrPN6s8=;
 b=gq1rNC97Rr6AfP6kgYJiCvx+TAnguYW00TQ6fHUO4m5nHCyGcqOCkI7DSGDzjax9FO
 8w8KbVmZm+HBuHyEdec/OwXOkOCzKMbwVIMxMPii6Wq9LnCGCruP+JpYBFFGTBW2elBN
 Ud80KoqRuzW6Fc6Qvlkh54m80P4PWqtsPgbj2z7a3rthD+w2VyPX9CYJ6Y4vZmi7Ub1w
 brcdWUJBW8dZclRQzF5XIyYmg6t2s9LGO9dTcnGCKzYXDnW/93PphYbpMI6nyvbe98M6
 W5oDdUjGmCFmwL+9yV1DlBEutTlvjcVzAc1U6CRz+Wcjn4CKoYQp8U7cGGFnZ+ppmemM
 J8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772241151; x=1772845951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aaPoQfadeqAcC/F2pMAhUC8silyGRKBmTmyeCrPN6s8=;
 b=nxmnQ3moKZ0RyDGIpe4OaoVoIxtJNOaRzPv2l1BGrHqeR2S0eeKigq4Gm607ZqtPcB
 L+4Yr7v2oRVuf0feCRCkrPxTJZgPb6+b/bLxq/wZNZ9hLrSIOkrRG1kBGnru560KdhVA
 ih7D8C1PDaudf/AY2mIFZAeP5VmWdVeTlLsLi4J3EkgLyAeLlX6UqdWDU6GhV1Bjr1RM
 HZkLUn46yhViXWp8hzF1yvBm+XTt0Qqhs0ImB/GsRdI9Slfw456qOCt2kJE+3T6LDPd3
 S2mEqCqJxNX8ic3/ANl+bKtnfnPKXsDGr0H4u/SD+t4ScVytm1VFojBu+8pI8Glivlgl
 zvdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmp+tNsIRm6DpDVrM7i70ZmdyfNEyijytnuu0kqdMdmFW9VhZ0twZGfsAZtOEP1y7jj7Fl7TXy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkOwh72+Wyf765d5D9ZQB1kMxbf6X4olgIeqK8ttmNYsxnS179
 VoODubFYrArue02X3CW8mu36AKZ21yYeCYkbOIkPJ3Mud1BgY8WxCT26
X-Gm-Gg: ATEYQzzMa6MIBRxc7sXwdX9BNhILBjpnOud1RkfU7VkU3dzRSFqcLbdMiTbHjbZvWsZ
 GhrKYDh/bNe8w0+WtGJs9BHrT8M5IRTUklaLI8ZO2wGPecf6Ny5WOBwGunFAmNKQ3mrPH5x4N+Q
 SJLHdcP/nQ4rL8O+kBLX2dphU+E5U9O5BF4ncOUMI3q4lGtSXHSEKZ01BnGHGZ5iPzxm2Xi/GKi
 mnrEB97RtCYK8uRmEblIymoiKJk5KkcEhUN26PGG102csAOAQB8deoiYZ9U6SFsBnpG7fm0Grom
 itSuH0QZOq+gp2PNzD6IBnXAezbCNgQ3Q8kA/qc9n3RnrV8LAqDxGkueDFgsPbLTILBac3v32bF
 2fJ3A/L5LNqZJv7enQSC6zoljj6L4qvTwpoIHY+2qgOqYTHEbG77Pa3XMG/v37MQcVzZdcaJuqK
 OBTVwYWlalTgPDBcYc/FIf25SITKP1r1VFDz7ZqlKddcA8gfmQ4qQymQ==
X-Received: by 2002:a17:902:d585:b0:2aa:d816:e1a4 with SMTP id
 d9443c01a7336-2ae2e4b0d3emr60789735ad.31.1772241151401; 
 Fri, 27 Feb 2026 17:12:31 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6f46c2sm75772845ad.89.2026.02.27.17.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 17:12:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Evan Quan <evan.quan@amd.com>, Sasha Levin <sashal@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Eliav Farber <farbere@amazon.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhigang Luo <Zhigang.Luo@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Bert Karwatzki <spasswolf@web.de>, Ray Wu <ray.wu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Roman Li <Roman.Li@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Wentao Liang <vulab@iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH for 6.1 0/2] prepare to fix panic on old GPUs
Date: Fri, 27 Feb 2026 17:12:11 -0800
Message-ID: <20260228011213.423524-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 28 Feb 2026 09:19:10 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:evan.quan@amd.com,m:sashal@kernel.org,m:mario.limonciello@amd.com,m:farbere@amazon.com,m:lijo.lazar@amd.com,m:Jun.Ma2@amd.com,m:gregkh@linuxfoundation.org,m:Zhigang.Luo@amd.com,m:srinivasan.shanmugam@amd.com,m:spasswolf@web.de,m:ray.wu@amd.com,m:Wayne.Lin@amd.com,m:Roman.Li@amd.com,m:hersenxs.wu@amd.com,m:vulab@iscas.ac.cn,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,kernel.org,amazon.com,linuxfoundation.org,web.de,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CE8EE1C1A79
X-Rspamd-Action: no action

In order to backport upstream fixes for black screen on boot with DC
and old GPUs, These two commits need backporting for 6.1.

Related: https://lore.kernel.org/stable/20260225215013.11224-1-rosenp@gmail.com/

Alex Deucher (2):
  drm/amdgpu: use proper DC check in amdgpu_display_supported_domains()
  drm/amdgpu: clarify DC checks

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 32 ++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 .../gpu/drm/amd/pm/powerplay/amd_powerplay.c  |  2 +-
 8 files changed, 25 insertions(+), 21 deletions(-)

--
2.53.0


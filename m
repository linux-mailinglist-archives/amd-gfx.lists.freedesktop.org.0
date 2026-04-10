Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLoxHDij3GkEUgkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2026 10:03:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C603E8B4C
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2026 10:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC6210E363;
	Mon, 13 Apr 2026 08:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i7eCrb8B";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1781410E161
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Apr 2026 10:11:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488b0046078so18468305e9.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Apr 2026 03:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775815905; x=1776420705; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xvK+cWVb5nyXJGKfYp+f/XErIGutj22cTr84/e26k6Y=;
 b=i7eCrb8BTTyzWqV73BnFjoPHYUrr0FlvTvNvsAPlvTSA/oEWLDMWF5Zb9xLvy7qvrg
 jmcxqOIL3QUA3IM1vxrl4N6qCDgQKschg6Mx+ci+bGj9nb98M2CNmucFuvjchsT8FOCe
 wHaWGwSreggrNNC2hNORDID4cLaJNFzoDNscn3zTutubnFHGBR0e7COkK91lxlgFVOEn
 iCB/QkrYWsXnYqq79/48W83IS8/JVAJkqe/ICkvxY2SMuBsWB9o+bcHq+sOQk4/Rv9ir
 MZ+dcFnSxq5z9esUFgMmmlaVBoZ/88w3eUaB8LCJl2g5q9piKcMuWEJ2OyoRLauymBjv
 2L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775815905; x=1776420705;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xvK+cWVb5nyXJGKfYp+f/XErIGutj22cTr84/e26k6Y=;
 b=NAaLHqnasPQeMjnazROnXSlXPr8jAVCfaSeNM5qEzvDF3kXLx5nMvirX6Lj/BvcPTX
 rnzwLqFHyvwkoE7L4Y1zkg/l7Cs1CKjCyJ6wATSZk+xY0U5SeKoPNdHXdAL3TWueGfdV
 YgWiyOtSWEUMsd6kVCKktkamN4hWd+XMEn7L1DYZdJVkD4pCNXUk6YeS0/iRBmhpIpuL
 yPLFdnuM7yEtk1oVlX8DqJ/KDf7iJeYn5MhLKygHDcTmNjr6rGuZp05cDuToKunxvhsF
 kQhcMI8XGvNFVkKYZGL3LQKOmIbyTfmJuziM9ECffzMMBgHp07Oee9CZnHhxSQR/3N0d
 ZsSg==
X-Gm-Message-State: AOJu0YxSV+C32/qcaMrS/m8wlKlzBSopnkiiV71rnw6/J3q6x5d/b6YO
 aB0Fz19EVyXgruv5q9VyUL3ZekEsw/K3t6LYg9r21otImuC38A5L6Ocy
X-Gm-Gg: AeBDietRAnkC6FcaIlCVVWSRWNATJB61LJQq8W8dN/qVSbfyBxy0PTDEwkfGtS0VUEY
 KxzGNmgomutLXNXI13gAhhP0Z68Utqix/1F0gJT2DYqVYAKF+vOKRTXB5Obn9QzgPpsT3HDRG5g
 ctGz5BB0HeOgCaW4akxLwcGbRy0kPupbwUMpHEK4bM1Egoo6CpdU3z6hnh4lB577Inru7icVzBT
 cXuzNRQQ5YiKOD4FMumYlmPjlIKBEojuPszQ5tb0Sed9gKjEn/spSrNJ672+ErnqfbSVDS/1vi5
 7O6hVj44iLYhz7jw2XqqqbY6ewuB1/B58A5CGLKsJYbK1n6KyrsWQN7LRkTrPfmsqkQ7nERGvQV
 a073uuCJxHhFTQ3bCxUdYM2hjnIJbBfZPo7IASi5uoxPRi9/dFlfwYETuSbRuyshzNMHN3kfTA0
 Sy9izsloUBbBUdzs0oE4w=
X-Received: by 2002:a05:600c:a415:b0:485:419c:4eba with SMTP id
 5b1f17b1804b1-488d67bf7abmr24004405e9.1.1775815905457; 
 Fri, 10 Apr 2026 03:11:45 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b56d1asm62823965e9.15.2026.04.10.03.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 03:11:44 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:11:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>
Subject: [bug report] drm/amd/display: Add new DCN401 sources
Message-ID: <adjM3r-OTqXOk3Oz@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 13 Apr 2026 08:02:59 +0000
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	DATE_IN_PAST(1.00)[69];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aurabindo.pillai@amd.com,m:SRINIVASAN.SHANMUGAM@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 20C603E8B4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Aurabindo Pillai,

Commit 70839da63605 ("drm/amd/display: Add new DCN401 sources") from
Apr 19, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.c:385 (null)()
	warn: double initialized 'dsc_shift.DSCC_DEFAULT_MEM_LOW_POWER_STATE'

drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.c
   164          DSC_SF(DSCC0_DSCC_PPS_CONFIG22, RANGE_MAX_QP14, mask_sh), \
   165          DSC_SF(DSCC0_DSCC_PPS_CONFIG22, RANGE_BPG_OFFSET14, mask_sh), \
   166          DSC_SF(DSCC0_DSCC_MEM_POWER_CONTROL0, DSCC_DEFAULT_MEM_LOW_POWER_STATE, mask_sh), \
                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   167          DSC_SF(DSCC0_DSCC_MEM_POWER_CONTROL0, DSCC_MEM_PWR_FORCE, mask_sh), \
   168          DSC_SF(DSCC0_DSCC_MEM_POWER_CONTROL0, DSCC_MEM_PWR_DIS, mask_sh), \
   169          DSC_SF(DSCC0_DSCC_MEM_POWER_CONTROL0, DSCC_MEM_PWR_STATE, mask_sh), \
   170          DSC_SF(DSCC0_DSCC_MEM_POWER_CONTROL1, DSCC_DEFAULT_MEM_LOW_POWER_STATE, mask_sh), \
                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Only one of these is correct.  Hopefully, the second one.

   171          DSC_SF(DSCC0_DSCC_MEM_POWER_CONTROL1, DSCC_MEM_PWR_FORCE, mask_sh), \
   172          DSC_SF(DSCC0_DSCC_MEM_POWER_CONTROL1, DSCC_MEM_PWR_DIS, mask_sh), \

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

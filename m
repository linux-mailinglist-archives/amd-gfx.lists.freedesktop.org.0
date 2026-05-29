Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP4tLTd7GWpHxAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 13:40:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1DC601BCD
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 13:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70EE10FDB6;
	Fri, 29 May 2026 11:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ohuC1wz+";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED93A10FDB6
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 May 2026 11:40:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so143481f8f.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 May 2026 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780054834; x=1780659634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A6u9YQBx5a51F8fm8zqzaMdB1I+HWop/Y2OuGryekEU=;
 b=ohuC1wz+oGzDctTKwpVKEz1PkUqSwKuwrdABqjGPnRSClqPBrQdnbCTroM0w6FPfIg
 5EuRcH1HqhhM7iC1E6IxhkfDiHr+4vB65xCsE1DOPzqLzuvUmHPU3latDS7d69++9FQc
 VjI79g5IJ9NP7Md3tGJ4BVkuv3ofSuEufhe3MkTceEu/QmUAQjR96EkRVvq+Xzp5iSQP
 xTINmm/mSdbt6gkJDXfDz1epbzeONJR7x1zY20sas2qJIoYHF0hy5bjkQkxPFwwezFL8
 fsCe9Gdgx9KpZTr9vB3UtCNjGZFyrE9BR61exMTdySA4VW+jJOuinFL7EcRzlRNA2iki
 bspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780054834; x=1780659634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A6u9YQBx5a51F8fm8zqzaMdB1I+HWop/Y2OuGryekEU=;
 b=mGgxD0urYyc6PTMzBVod0MQjntUh5Qekz64WPkgfGGlKIZGJkzlbczD4q1PCRtSeFT
 JDjc7u8B8zVHQ9anKi2l0otSXMjAT1GPQ/LpZ9TpzjwZeBFXOVKRC04kYC7OcP7TUFy5
 0Dtb/TjHbtihFKqAV3gIQBmWMJ6lKzcbaFpkWyRE0K6HlqtWOe6nBusdLG8/ckQCqIlM
 XISsm2ZH9MCEW+ALLXY9Ts4oXbyi0kUCvnXhl2+WlOl+b2D787tjVTbZIZbwa0viXPSi
 ZAl6K3CVv8bX1Ri2zWaCRoGFrTC30vmOSFicVAvLxR7/co6j3qAYHDAbFKWxVmUWOU2n
 JTIg==
X-Gm-Message-State: AOJu0Yzz9NYSZ73W1+nP53LqGhiLNN9x+4n11pCmsXELz/vqssKpx+J4
 aRmF30lZmF6e2I3HsCg3bqzijyJbu6VNZU6DFT4+8Efhltrlu2Zf4gnx
X-Gm-Gg: Acq92OFZpX2tOht7UBlrtCdC2bNdb7S2ygj2IsKJYos9dvllj8e07MJdVihAK4o+F2g
 II1j4zrX6Bz0KNgFn0F1AgN5Os8OGDOTSrQxfp2ELGTMhnCoRbKvNz0l7bEDlugio+ZTv/p0wfo
 lUICOa6kJEfZfSd/cjJ//GfSJUkmuJuSKKeut2+MEAyv0WY5YiIFR6JesFAx7GSjyQJryM6jtGN
 Z2mbdaYmUl7K7E7gPJu2YP/yeWVV7JfpRRY5TlAcP0uHrJEuA+mlP3cvzBSEF0yUotI9ZPfGjIZ
 WHTzswCkZk0gpTFjZjvJV+zfgN+1J49gXb5oTFbqkaC7Skg2onF2cwdqoPc0iHIsFUTQSLXiGJ7
 gP9eP5yJbRz+zAznY66s1lKVSOJo8+DVAMgNDiTmg42AgsIeCTPLJAxxnusqgfjSGsy8j+7BfEn
 YuYDNZQggrMgvlkXAmiGjIeLB+3j6kFAS3PgMaO7Esx7s=
X-Received: by 2002:adf:e008:0:10b0:45e:e44b:312b with SMTP id
 ffacd0b85a97d-45ef1444276mr3126155f8f.18.1780054834223; 
 Fri, 29 May 2026 04:40:34 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1544:8100:da55:fa26:bd:a26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cf0dsm2993109f8f.17.2026.05.29.04.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 04:40:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: natalie.vock@gmx.de, honghuan@amd.com, Alexander.Deucher@amd.com,
 Felix.Kuehling@amd.com, Philip.Yang@amd.com, timur.kristof@gmail.com
Cc: amd-gfx@lists.freedesktop.org
Subject: 
Date: Fri, 29 May 2026 13:24:02 +0200
Message-ID: <20260529114031.3714-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(1.25)[subject];
	EMPTY_SUBJECT(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:honghuan@amd.com,m:Alexander.Deucher@amd.com,m:Felix.Kuehling@amd.com,m:Philip.Yang@amd.com,m:timur.kristof@gmail.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmx.de,amd.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DF1DC601BCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi everyone,

this patch set aims to fix a couple of problems we still have with the VM, page fault and HMM/SVM handling.

First I rework a bit what we have on headers/defines for the suballocator, especially that the right GFP flags are now used for GPU reset and graphics page faults is important to avoid hangs.

Then I rework the VM handling, especially splitting up the amdgpu_vm_update_range() into an amdgpu_vm_map_range() and unmap_range(). The later is only meant to be used for MMU notifier/HMM/SVM use, but I couldn't come up with a better name.

And finally it fixes the problem with KFD SVM that we can't properly allocate page tables under the SVM lock. The missing piece here is to remove the SVM lock and rely on the eviction lock of the VM for that.

Timur & Natalie I've put you on the patch set because I know you have page fault patches in the pipeline, it would be nice if you could apply this set to amd-staging-drm-next and rebase your stuff on top of it.

Honglei and Philip this is basically the pre-requisite work I have been talking about. Please integrate that into the new SVM patches and re-test.

I've only did some very brief testing, so something more extensional testing is clearly a good idea.

Thanks,
Christian.


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iUZxCBFDUWrOBQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 21:08:01 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C5C73D8A6
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 21:08:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Wl5mKIJW;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426EF10E22C;
	Fri, 10 Jul 2026 19:07:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E91910E226
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 19:07:57 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493ba701891so11288605e9.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 12:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783710475; x=1784315275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=v2c8ve1eOpm9ZGAfxSFM+Y9p3YLh5Tuis6XJ274g65g=;
 b=Wl5mKIJW+gypC41Qjfq43vp55ugRxhTI/puXySzvb/UBy6Wf0sZECZSiC7IpFaBlon
 dajsrN0KwFoTRqJPqaURB+TTNIK4bN7W1eOGU8+cN/An0tuG0wSf0tNXeR0x3JiEFi2o
 slHVuOs9ii291pEWAYcO5D9+TwntJYRI15kngmOoWgaQGgMyOMx5/GwihIu+i9cEBtx3
 8HXXDDWmB3uqcUNmlCrlLCP0RF6jSCLaXyK9SR3lovO7yRTxifZ79TkL2ZEuujv2C/aG
 /TR+AMSfqiR3yWoA64BoVfdY3OGr+jjE9u4Pqar6WzLysjaFNDdL5JB5viGWzyWAzc8t
 /8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783710475; x=1784315275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=v2c8ve1eOpm9ZGAfxSFM+Y9p3YLh5Tuis6XJ274g65g=;
 b=rwVzqrkdlvzjHt+TYku5qeF9idae+0bCxZhIrPbi3bmb5CiLcMaWSDfmsSg6HHAnc1
 GcgtlugYF+LnegLZEIQyswz2iVRT+MqDlbC1gpts/mS/1ZuVYAoXID1nh0Iat68NySJC
 SVFOwIYbyHwany7Bb01YHwiM3pY4qPH+y6Qnen+Cc1c9xpLstl4oSDggs3/A42U3EZPm
 dNpiRneOiXWpxBjwYueVc8Fbso5kSVFSXBVzl+AVlgDwVdJnKOxgJ69FeykVtmbWpG9f
 A7ozoo3rYr/tzq62y6HbFt8uVOcTwiu1iaMu+1Gy9xCCzwLjHv6LCbWoF/HdPquDsIG1
 asBw==
X-Forwarded-Encrypted: i=1;
 AHgh+Roz6VG/v4a5edlFNUAFXytcJdECUvL9ft0LALDND0MoAGH6oy2z4WzVJHBZj0ePBjKp0jVR01QU@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1v/wy4AQC3n5ydPyf39fYudN8xxsY0Be4TXtJt3u/H3/rMI43
 RH6h+Oqrozse2XJNpfzRhZw/tnIIkNxghD4tORAkRf+fBdh16cvvW8gt
X-Gm-Gg: AfdE7ckwUuU2tabGTGHzcFxrKpVJRYJLZNYTVI1vhe3W36+zQIMj9H6ZnAFd6plAf+o
 kf6y8gYl2jDGLEC36L0NdgeQYNO/xJ8iVyvgWwoZph5bBGgvT8BjR9dh6FphiAVNX/WzhOg/tGv
 DQfxe7o1sjImFuVbdM+5nDciN2oVkHjDMA624/CfID7+Ylr++50BN2LtfL8L+8O31LqPvf7IO/S
 X12Vu5eQe1O5bHnlBldDXIrIRPHFDAIF5WQHag2BSVjwjZgjgh7Zn3gmd3fPrXK/SDvOT8S1ngg
 sjGXbg6/QCWED3EBjiLcIE7mtPGNrTeIMbfkDZtpsgc3tLDr6WKhSgWMq0JJWl7otBoepBCYOhd
 RCNZiXHFJA7CVTOP1cDSjRxJfO+TqAqU/SJi37F8Mcfe6NAtqDeeQe803aq4stgB3xQW2bW0n/r
 jLWnzueLcVVZN/pLc/y5lle50iHg==
X-Received: by 2002:a05:600c:5489:b0:493:e97c:216e with SMTP id
 5b1f17b1804b1-493f8851d4emr810365e9.39.1783710475270; 
 Fri, 10 Jul 2026 12:07:55 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154f:ec00:aa08:de24:db33:4496])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f567eadfsm55000755e9.6.2026.07.10.12.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 12:07:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 simona@ffwll.ch, matthew.brost@intel.com, nat@pixelcluster.dev,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Refcounting dma_resv and using that for drm_exec support in TTM
Date: Fri, 10 Jul 2026 20:52:40 +0200
Message-ID: <20260710190752.2355-1-christian.koenig@amd.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thomas.hellstrom@linux.intel.com,m:dakr@kernel.org,m:ecourtney@nvidia.com,m:simona@ffwll.ch,m:matthew.brost@intel.com,m:nat@pixelcluster.dev,m:airlied@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,nvidia.com,ffwll.ch,intel.com,pixelcluster.dev,gmail.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70C5C73D8A6

Hi everybody,

The idea of ref-counting dma_resv or ww_mutex came up multiple times from
different people, but so far at least I have abandoned that as to
complicated to implement considering how widely used that object is.

Thanks to AI I gave the task to refcount dma_resv to Claude Sonet 4 just
to check how horrible it would look like.

Well turns out that this is actually a cleanup we should most likely aim
for and I'm really wondering why we haven't done it like this in the
first place.

Not only resolves it a bunch of issues with dma_resv instances shared by
multiple GEM objects (we just recently had a bunch of patches for that on
the mailing list), but also allows TTM to implement it's delayed delete
handling without any zombie resurrection or similar hacks.

The patch set is totally work in progress and only survives a smoke test
with amdgpu, but I still wanted to check if the idea is valuable and
should be looked in further.

Please comment and/or tear apart :)

Cheers,
Christian.


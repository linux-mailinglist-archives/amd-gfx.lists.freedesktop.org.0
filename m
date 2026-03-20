Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJJwOsl4vWkA+QIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 17:41:45 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3C2DD9D3
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 17:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA98C10EA9B;
	Fri, 20 Mar 2026 16:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C1UQIbN/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0028110EB3B;
 Fri, 20 Mar 2026 16:41:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E2D6C1A2F12;
 Fri, 20 Mar 2026 16:41:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B4670600E0;
 Fri, 20 Mar 2026 16:41:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DED5210450CB5; Fri, 20 Mar 2026 17:41:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774024893; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qdUrmMGhafvscV817+9XgFETfjaNlHsyehdI2pW0Caw=;
 b=C1UQIbN/GCcAgGjk4PzKBnilwupWKREbzynzdsP+ykFv0wX3mY4FvuHWmksVoVPFm+ySGk
 EcI33lgadaq5ZIfKWRiLytcteWN3EEIsZVhrqh+sR/XTJhUx8DprdSc3XV1EfHs3SmXUWZ
 S+2Tk7OD9Snvp/Dm1MXFi6TZzrRgfp1c/dERiz4ot/NmM0mwBDlao0zCrbsO2UAZZ817vd
 6jztvt3TQmgbnpB/KpuEnavFZCdIbYevc0LmTqqf4axNA+qe1fUYSTpkKA29gpvmog7HgY
 nrw60x+Yl8sEKt/wyEN07S5A4yNnLuI6mxo2NKPPEkAQcBrvsG165d+bH67ctA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 00/65] Fix DRM_USE_DYNAMIC_DEBUG=y
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com, 
 gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>, mripard@kernel.org, 
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, 
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, 
 christian.koenig@amd.com, matthew.auld@intel.com, 
 arunpravin.paneerselvam@amd.com, louis.chauvet@bootlin.com, 
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
Date: Fri, 20 Mar 2026 17:41:54 +0100
Message-Id: <177402491424.6181.2389443184024817919.b4-review@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=700;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jk0+uq64YlTAHpBmMy9zhof+kqqzT3pxd9KtMcDsIO8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpvXjWTeJ2USumyZi9CPI8ZZr8jtCzGLtOAVqC5
 Uh++WDDlLGJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCab141hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLI/xAAu8VV2IGHs18GzfV4j3X+qF6MrbDvQOZ
 okyU65mQJQ9WEnu/TL2aYPru67N6xJBu95/AVwFVrzAvo2smBmrhMpF8Ib78BF8wrkcZEalsgnJ
 vZgy9A8vnaDgC5+4M/TtrapjaaIPS5EURByDRkcj5CjBHgz0DbE2jVkG3k21oiY+0faQIp6g3tB
 6k+L1n8FhFlzs/BdF20i5b/eVEhg4kKom1zHoomfxp8k2jXuHDVdZgPRaqeJJF6ULgT1CyhG8Pe
 JFss6GEWZKyZfSbZVPA75X6WyaGjLFZXEReXlyUAtlBLFGmsa7XrIdPzCY+pRAQheKsPz0rH9u7
 FnrEoP4zib+2tSRMQWikCVz0oBmM8YufSK7Z9ZIcZBv27o+PB1FY563GS6HdiHhimV0NYThDaaL
 SIhWqshHySnltwvYF+vsQl7TbWVRfLjXoIr/2I0Hzf2VUCSYSrLi43KzwE0Y/FRV1uU0RykFxUU
 QxnyU/IH/SOFHLpxdiTm/XZg4AK5yOiOMg7A10LwAVrdP0yNqQPT4e0HSwm6NY3E1QsMTY/tqhA
 dXNzpp6ll7tZ+6riDcHasDQq/yO9v8WAKYfNc/Ebx7fGTmMcqG/f7k9UhKr4PKjgeo1ciPsnqFa
 wMR/LU8ImxXEB6Z7I83alLEV4P/55RdwTUBP71c5QHDWN3PqNCE4=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.de,linux.intel.com,intel.com,amd.com,bootlin.com,linuxfoundation.org,suse.com,chromium.org,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B9F3C2DD9D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jim,

Thanks for this new iteration, the whole series is in good shape, and I am
also interested in the "future work", you can count on me for
tests/reviews.

This series is very long, but early patches are trivials or tiny fixes
(4..11), can you apply them to reduce the overall size?

I will add this series on my kernel to test it on "everyday life", I will
report issues if I have.

In addition, can you move the accel and class offset implementation after
the rest? I think the "basic" part is good and could be merged soon (my
comments are minor). This way Lukas can start to work on a stable basis.

Thanks,
Louis Chauvet

-- 
Louis Chauvet <louis.chauvet@bootlin.com>

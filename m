Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP50Gu/cCmpV8wQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 11:33:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D16569CA3
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 11:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FF310E75F;
	Mon, 18 May 2026 09:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="FkOaEQAi";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2D810E20C;
 Sat, 16 May 2026 14:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 950D2410B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1778940583; bh=ou8DOGO+SAzFBsITu8uOd2acXVesjslZQVd52PzTi6s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FkOaEQAiXekO5PIMvT466xeKe6fz+LPEpA0XS5Uag4J+nfmEdmU6HIrZGBJYOGQgm
 nuwVf4OtiaO81wyi8KFYxQ+6df+IvzsPQUUccFgd5n5jc2s7FOdOJ8os63dAN3mDLW
 QKDSFyA/Djymuje+VGi0MT05sb5JoHyLo6GfSya38SyF2KFfGpcI+STADgAHPiPGIo
 PqJZEVNhHxMc66G6LlBtZu7l917oDvGyX+zDlIPP5Umq/OozWiLWaNYNd8eGKCRiwN
 w9Kaop3t43V7SN3E72e/KnanMIcfPrtS+RH5lMCDGVTjjqB3QIUc0v0rgn3bPrhLkC
 e1RYQl4cVVeUA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1)
 server-digest SHA256) (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 950D2410B8;
 Sat, 16 May 2026 14:09:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Cheesecake <cheesecake2960@icloud.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Cheesecake
 <cheesecake2960@icloud.com>
Subject: Re: [PATCH] docs: fix typo in mpo-overview.rst
In-Reply-To: <20260516100406.21070-1-cheesecake2960@icloud.com>
References: <20260516100406.21070-1-cheesecake2960@icloud.com>
Date: Sat, 16 May 2026 08:09:42 -0600
Message-ID: <87se7rmont.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 18 May 2026 09:33:27 +0000
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
X-Rspamd-Queue-Id: 92D16569CA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	DATE_IN_PAST(1.00)[43];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[icloud.com,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,icloud.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[icloud.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Cheesecake <cheesecake2960@icloud.com> writes:

> Replace "transparant" with "transparent"
>
> Signed-off-by: Cheesecake <cheesecake2960@icloud.com>

Patches need a proper signoff with a real name, please.

Thanks,

jo

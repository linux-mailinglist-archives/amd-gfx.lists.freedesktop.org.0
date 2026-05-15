Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j9qVHgqwB2poCgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 16 May 2026 01:45:14 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE355969D
	for <lists+amd-gfx@lfdr.de>; Sat, 16 May 2026 01:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6D310E43F;
	Fri, 15 May 2026 23:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=triang3l.ru header.i=@triang3l.ru header.b="Aqszet8y";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out7.jino.ru (smtp-out7.jino.ru [81.177.141.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9CF10E43F
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 May 2026 23:45:10 +0000 (UTC)
Received: from [192.168.0.195] (unknown [5.18.177.157])
 (Authenticated sender: ml@triang3l.ru)
 by smtp-out7.jino.ru (Postfix) with ESMTPSA id 34FD33780BAA
 for <amd-gfx@lists.freedesktop.org>; Sat, 16 May 2026 02:45:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triang3l.ru; s=dkim;
 t=1778888708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fnHyhE8OC7E4tandFEoDZ0xs3JV66veXOI2xfewdno4=;
 b=Aqszet8yuKxYDsTXG18Za08teAPjLZyoxoW6wTpGxiNGIxMjCxkR0ZvG2dnVCD2mntAm+B
 zIA29UfPstLR83x934qe1zpsXUh6FRnQhFKqd5XT3SANU9u/PmJUbPOZYUZxA2KEB5duMz
 IYX6pJKpaH7AmP5/ruwUdeEWqn6fYuEXhdKUzFp8MjpHclKoYoGAMtFaQaE5Tyvp5yky8o
 1Ctg6Lhfp/QOHO9oGD+n9ez+QrgbyunlqZObSLHKmqKuuqXV2yvjyvUUPN2xgli3p5kJ9b
 L1k/fClUMeOcm3EQPo1A5B32QW92hkiR8YpNmaXFwalzRsY/U+kEgBkvgYwsTw==
Message-ID: <3fab7c2d-8979-43cf-a38c-3d59862e08b9@triang3l.ru>
Date: Sat, 16 May 2026 02:45:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: amd-gfx@lists.freedesktop.org
References: <20260515091054.529610-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/radeon: avoid printing NULL strings
Content-Language: en-US
From: Vitaliy Triang3l Kuzmin <ml@triang3l.ru>
In-Reply-To: <20260515091054.529610-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: E0DE355969D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[triang3l.ru:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[triang3l.ru];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ml@triang3l.ru,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[triang3l.ru:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[triang3l.ru:mid,triang3l.ru:dkim]
X-Rspamd-Action: no action

Nice catch, but NAK on the proposed solution.

The NULL prefix is passed to 'evergreen_surface_check' intentionally to
disable printing the warnings, and explicitly handled, but there's one
place where the NULL check was likely forgotten.

I've proposed a patch adding it there with a detailed explanation:
https://lists.freedesktop.org/archives/amd-gfx/2026-May/144615.html

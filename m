Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNnVJmPohGnb6QMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 05 Feb 2026 19:58:43 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412ECF6A3C
	for <lists+amd-gfx@lfdr.de>; Thu, 05 Feb 2026 19:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE2D10E04E;
	Thu,  5 Feb 2026 18:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GNWrED9M";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7B310E085
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Feb 2026 18:58:40 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-124a2dc92dbso53790c88.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 05 Feb 2026 10:58:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770317918; cv=none;
 d=google.com; s=arc-20240605;
 b=bStz4g30InNdD3xhg5ZplwHNv0MRlRI1BKvBNS1SQB95Hjty9LB20Z6rYfey/21Ief
 TZamCkc77tCpFWS/OXRPeFa/ATnq62J1P5v/gU8lye6S2wSTHwuCCS06Oz93mUwMOLb/
 BzuKx8//R7GNUS2RS0cPO+n2tCgprWmJ6x0an9E2oVt5X15axdJ6aXoTUmTJsNEd44m/
 YMZmati+juI8WX7HhuDRs8LRy86PGLF5wzgHd1D8MnbqTOMl4cg/ieqNKcWLWpGNieyX
 EbEhvpoQYKVd8FYsLSfPjXo3SrmCyUrGpkGDQozhMtRBcPlpRqG8Z/7DagCX0Z3Fmlkr
 Lx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=zoGVwy4LRkxpr0BHHCLpaHENAAk0g5OLxtCpZU771L8=;
 fh=CmoOW/iJI4FrFVyeB+R9uX4Avkv7Lv0DfC0a0aF7jnQ=;
 b=gaZOnwZW7PwzKps9pX/13C4yf97ZpxqysHhL/yaCsMcOjYSzQqYqhXM3sT9cy/iMEz
 xsJ+beGSNMgYQiHcWKa5JplJSLBdYNwTj/zgA9s0SQ2/sAqTHkzPPlFq2RNXef9Ugfd8
 3fML5debFd2YPhVKT3VmSC0FPedURNzABTbJqtHCV0MXYCwBq6knVQkZaLkMRfVX/se6
 xSKSEqZnzG/GNT9BHsMSkSe/dLKk3nFpVkT6IydNtmrTg/MKghqIctY8DfFYbinI/nbL
 b7mUkM2PYUyfWqmVGPL2X7aLMX7aQRXaA/y/FED2GIULtHOvNP5ATK5tg1kEQOYCZ9T7
 xqEw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770317918; x=1770922718; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zoGVwy4LRkxpr0BHHCLpaHENAAk0g5OLxtCpZU771L8=;
 b=GNWrED9M6+Mji79bMZSOkfHy+vNtFXSeKGB9bcDDpmgHMbWCbqkiULtlqGonCTAV49
 Ecw9mO60dVBk9R5vz0ZlPLLz0iMzRQr2yLBN0EehyRjs2VMZY6FqcO/UzMH/RRrkjqC3
 rmIfrZ3mACx4eGoKutQuJT5WqSSaE139xh047MxTeE7i5aj5X8Mq4OMTL/6sfYm0pzt2
 ZM6577yvchQ7qUkDHQ3hFYyFQB+iyqhi1UUMzaUNQ4TlTzS6jU9bJXoiv3mbudmr7y58
 /Xe6HD0RP3gJ2WWd13Ew8x8sP341V/mn1lT2Bdq1RmLj5GsPwGqRndQcsPP6rWDKdWwe
 sGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770317918; x=1770922718;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zoGVwy4LRkxpr0BHHCLpaHENAAk0g5OLxtCpZU771L8=;
 b=AeTbZlVd5Wjp4nIZl446T5psyPZq+eadCYlLMkj1XJnnqwK5AUtaCuwia1Rlw4x75v
 q2oz3OGiFqyhXf8SwVodZEEVrSdXWP0iMNk2NVMls2Lp6bZzhFy7pOXQvoA4dBFaovDn
 +pNayIFNlZGwdmNvhv66bZdjlY5wf5GxQtPfDgIWVUBgDbqVGiF4YG4DjMdfunsISj0x
 tcDHmzuzwuVOGEKIYRJQJ7Riw3WvOtD8LHEu42I+WyNVxYLOFtQ1nejOgHQyQYffPT3X
 wVJwJslCuK/fBeKPDZbkbvdmwwQOcpZsLGBR7/1TyTOOPQ2D3sgm7IucizGjWyBaYJyw
 cFug==
X-Gm-Message-State: AOJu0Yw8XkDc+faYCw1Xiv6OGxCdgM7lHMO3avJ56+K7uLMvrjbxTywd
 4Xl4G48lGUUk18gvz5rb5Xkyqk0XEapxltDPjwAWCvdNeOYQuwsD184Xss6wQ4uw867XrEteA3B
 gjbzrSWiCrCkwIT9fpvmgJNRRFVt4hgA=
X-Gm-Gg: AZuq6aI3JB1jkPM5WN3uG0cZGZuDXNSysOTDULSMTqwsSOeMUaPPTrRH/DQKqejq/ju
 vw0v1OrCpVg3BvCnxgkr3ZW9xByVbd3hQ0hVcNQebjpp66++yI/v7wnZem5l4V2KJVPaZ6Yh11t
 pfhm0e8/yKjfMlZlGHFxMGvqg6/khyOp+i8ffbTaCTnJ3zIbCczu0A5PN10XxPt8vHrTTdgcd8G
 nqO0fMrQKwTns2xwrxZSHFNPl5Fn8PfI9bSw5KmA3HUcZhGgr+06cNYCHl14DPDqULS6wKf
X-Received: by 2002:a05:7022:1003:b0:11a:43fb:58dd with SMTP id
 a92af1059eb24-1270401f86amr58579c88.5.1770317918373; Thu, 05 Feb 2026
 10:58:38 -0800 (PST)
MIME-Version: 1.0
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Feb 2026 13:58:25 -0500
X-Gm-Features: AZwV_QhnvxAX3QFbhjBdiyAGYWhTIP9_aIECVW0vQxlsAVwvUQy6bpKUyXK7DNQ
Message-ID: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
Subject: Accelerator/GPU top
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Francis <David.Francis@amd.com>, 
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:David.Francis@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 412ECF6A3C
X-Rspamd-Action: no action

Has anyone given any thought on how to support something like top for
accelerators or GPUs?  We have fdinfo, but using fdinfo requires extra
privileges (CAP_SYS_PTRACE) and there is not a particularly efficient
way to even discover what processes are using the GPU.  There is the
clients list in debugfs, but that is also admin only.  Tools like ps
and top use /proc/<pid>/stat and statm.  Do you think there would be
an appetite for something like /proc/<pid>/drm/stat, statm, etc.?
This would duplicate much of what is in fdinfo, but would be available
to regular users.

Thanks,

Alex

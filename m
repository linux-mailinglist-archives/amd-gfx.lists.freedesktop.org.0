Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029BCD5A0D
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 05:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212086E1B2;
	Mon, 14 Oct 2019 03:54:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2A6E1B2
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 03:54:23 +0000 (UTC)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30DCD2083B;
 Mon, 14 Oct 2019 03:54:23 +0000 (UTC)
Date: Mon, 14 Oct 2019 03:54:22 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
To: amd-gfx@lists.freedesktop.org, kmahlkuc@linux.vnet.ibm.com
Subject: Re: [PATCH] Revert "drm/radeon: Fix EEH during kexec"
In-Reply-To: <20191009181503.20381-1-alexander.deucher@amd.com>
References: <20191009181503.20381-1-alexander.deucher@amd.com>
Message-Id: <20191014035423.30DCD2083B@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571025263;
 bh=uYcB8PgCIwdgGrIVcf3SezJHgLPztJ5ajN0YupMt4do=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=dcukEqjf/olPS5HcZk/UhAV5uMatMHZJRrNT9N0yovDcH+FF+2mBuDwWnUZ31bE4m
 VNQu0mbNlCigonnHPLl6H2v/9P1UE1nfUkgO9I/Ur0ywvi5TV+dfsIhRsbSzt0H/KV
 Ekl0MHvIwTbEtk/ERqqMZqVbZCtCR3aTvYBQNX7I=
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhIC1zdGFibGUgdGFnLgpUaGUgc3RhYmxlIHRh
ZyBpbmRpY2F0ZXMgdGhhdCBpdCdzIHJlbGV2YW50IGZvciB0aGUgZm9sbG93aW5nIHRyZWVzOiBh
bGwKClRoZSBib3QgaGFzIHRlc3RlZCB0aGUgZm9sbG93aW5nIHRyZWVzOiB2NS4zLjUsIHY1LjIu
MjAsIHY0LjE5Ljc4LCB2NC4xNC4xNDgsIHY0LjkuMTk2LCB2NC40LjE5Ni4KCnY1LjMuNTogQnVp
bGQgT0shCnY1LjIuMjA6IEJ1aWxkIE9LIQp2NC4xOS43ODogQnVpbGQgT0shCnY0LjE0LjE0ODog
QnVpbGQgT0shCnY0LjkuMTk2OiBCdWlsZCBPSyEKdjQuNC4xOTY6IEZhaWxlZCB0byBhcHBseSEg
UG9zc2libGUgZGVwZW5kZW5jaWVzOgogICAgNmY3ZmU5YTkzZTZjMCAoImRybS9yYWRlb246IEZp
eCBFRUggZHVyaW5nIGtleGVjIikKICAgIGE0ODFkYWE4OGZkNGQgKCJkcm0vcmFkZW9uOiBhbHdh
eXMgYXBwbHkgcGNpIHNodXRkb3duIGNhbGxiYWNrcyIpCiAgICBhODAxYWJlNDc3M2RhICgiZHJt
L3JhZGVvbjogd2lyZSB1cCBhIHBjaSBzaHV0ZG93biBjYWxsYmFjayIpCiAgICBiOWI0ODdlNDk0
NzEyICgiUmV2ZXJ0ICJkcm0vcmFkZW9uOiBhbHdheXMgYXBwbHkgcGNpIHNodXRkb3duIGNhbGxi
YWNrcyIiKQoKCk5PVEU6IFRoZSBwYXRjaCB3aWxsIG5vdCBiZSBxdWV1ZWQgdG8gc3RhYmxlIHRy
ZWVzIHVudGlsIGl0IGlzIHVwc3RyZWFtLgoKSG93IHNob3VsZCB3ZSBwcm9jZWVkIHdpdGggdGhp
cyBwYXRjaD8KCi0tIApUaGFua3MsClNhc2hhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==

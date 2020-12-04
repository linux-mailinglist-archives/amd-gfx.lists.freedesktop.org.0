Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450432CEDAA
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Dec 2020 13:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39FE6E13A;
	Fri,  4 Dec 2020 12:01:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC3B6E13A
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Dec 2020 12:01:30 +0000 (UTC)
Date: Fri, 04 Dec 2020 12:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607083288;
 bh=2JUdUvGzXQmIBz0+lmEahwr6+nMfH2pQHIU8Z03fm54=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=VMpCeObzgHmOKc3BJP/k2xTgznn207hoPEMpnhTpV5S19t/0l2jowaj9fjU18nahe
 DuRIfPxWeArQNKPm2Nfe0Z9rZecCqGMFmgJ0kJTsVJ6nynIDGYW2mUlzBmmj56sIsT
 kCU0s+erxj4RUnQagd5oem1hxdfnDXUvv37qDL0orMTEIfzFVR9uLxIJkJsmZlbJMH
 bFFbFffLEGPZEWcJUWPatL0HISgDkxN+eHLf/sg3zxhxYivWQDY/YWm1AtFm8DP9UC
 ydFIVNZOFnCz7UfMiNaOpK0BgIyTNg8orVSKRYLFpZ75JmxW8EBswrgxBBJK+HhzPc
 uVcT+ctISZHzg==
To: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amd: print error on convert_tiling_flags_to_modifier
 failure
Message-ID: <xrH38go5_dtuCm3o7suU4QZ54y1NxgeqLjS4XTn-6rXD-907wQqCNNSw_XV7qlwt8tm9lUgOJo6-MQTxoyQyLDQaGCHHoLBxPIdAfLzh9xU=@emersion.fr>
In-Reply-To: <71eb00a6-d442-8ff4-394f-554e5f5d020f@daenzer.net>
References: <j1fYvGbEZdykS0AhDWeyCo79c5aqNmrQBIuTcljx8@cp3-web-016.plabs.ch>
 <71eb00a6-d442-8ff4-394f-554e5f5d020f@daenzer.net>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCBEZWNlbWJlciA0LCAyMDIwIDEyOjUyIFBNLCBNaWNoZWwgRMOkbnplciA8bWlj
aGVsQGRhZW56ZXIubmV0PiB3cm90ZToKCj4gVGhpcyBzaG91bGQgYmUgZWl0aGVyIGEgZGVidWdn
aW5nIG1lc3NhZ2UgZGlzYWJsZWQgYnkgZGVmYXVsdCwgb3IKPiByYXRlLWxpbWl0ZWQgc29tZWhv
dywgb3IgdXNlci1zcGFjZSBjYW4gc3BhbSBkbWVzZy4KCkhtLiBJIGp1c3QgbWltaWNrZWQgd2hh
dCBhbWRncHVfZGlzcGxheV91c2VyX2ZyYW1lYnVmZmVyX2NyZWF0ZSBpcwpkb2luZyBoZXJlOgoK
ICAgIGRldl9lcnIoJmRldi0+cGRldi0+ZGV2LCAiTm8gR0VNIG9iamVjdCBhc3NvY2lhdGVkIHRv
IGhhbmRsZSAweCUwOFgsICIKICAgICAgICAgICAgImNhbid0IGNyZWF0ZSBmcmFtZWJ1ZmZlclxu
IiwgbW9kZV9jbWQtPmhhbmRsZXNbMF0pOwoKQnV0IHllYWggRFJNX0RFQlVHX0tNUyB3b3VsZCBw
cm9iYWJseSBiZSBtb3JlIGFwcHJvcHJpYXRlIGhlcmUuIE1heWJlCm1ha2VzIHNlbnNlIHRvIGNo
YW5nZSBkZXZfZXJyIHRvIERSTV9ERUJVR19LTVMgaW4KYW1kZ3B1X2Rpc3BsYXlfdXNlcl9mcmFt
ZWJ1ZmZlcl9jcmVhdGUgYXMgd2VsbD8gSSBiZWxpZXZlIHVzZXItc3BhY2UKY2FuIHRyaWdnZXIg
dGhhdCBvbmUgYXQgd2lsbCB0b28uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo=

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28924215BE9
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jul 2020 18:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DAB6E119;
	Mon,  6 Jul 2020 16:36:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E88E789FD9
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2020 16:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id E20E22A6046;
 Mon,  6 Jul 2020 18:36:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 3gH6wVfyFjco; Mon,  6 Jul 2020 18:36:52 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 3D3F02A6045;
 Mon,  6 Jul 2020 18:36:52 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1jsU6t-000WXI-BD; Mon, 06 Jul 2020 18:36:51 +0200
Subject: Re: [PATCH 0/8] DC Patches July 03, 2020
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20200704011457.2368241-1-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <19927257-4386-dc0c-6195-31100dd8f3b7@daenzer.net>
Date: Mon, 6 Jul 2020 18:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200704011457.2368241-1-Rodrigo.Siqueira@amd.com>
Content-Language: en-CA
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
Cc: eryk.brol@amd.com, Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com,
 qingqing.zhuo@amd.com, amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 Harry.Wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMC0wNy0wNCAzOjE0IGEubS4sIFJvZHJpZ28gU2lxdWVpcmEgd3JvdGU6Cj4gVGhpcyBE
QyBwYXRjaHNldCBicmluZ3MgaW1wcm92ZW1lbnRzIGluIG11bHRpcGxlIGFyZWFzLiBJbiBzdW1t
YXJ5LCB3ZQo+IGhhdmU6Cj4gKiBTTVUgbG9nZ2VyIG1lc3NhZ2VzCj4gKiBETUNVIGltcHJvdmVt
ZW50cwo+ICogQnVnIGZpeGVzCgpBcmUgeW91IGd1eXMga2VlcGluZyB0cmFjayBvZiB1cHN0cmVh
bSBidWcgcmVwb3J0cyBsaWtlIGUuZy4KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9hbWQvLS9pc3N1ZXMvMTEwOCA/IChJIGFsc28gcmVwb3J0ZWQKdGhhdCBvbiB0aGUgYW1kLWdm
eCBsaXN0IGVhcmx5IGluIHRoZSA0LjcgY3ljbGUpCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOk
bnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGli
cmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5k
IFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=

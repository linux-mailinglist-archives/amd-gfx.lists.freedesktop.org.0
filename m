Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE01ADB4E
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Apr 2020 12:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950266EB8E;
	Fri, 17 Apr 2020 10:43:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48EF96EB8C
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Apr 2020 10:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3DB322A6048;
 Fri, 17 Apr 2020 12:43:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id zbWLuh5UrNgk; Fri, 17 Apr 2020 12:43:49 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 8F4492A6016;
 Fri, 17 Apr 2020 12:43:48 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jPOTL-0009P7-MH; Fri, 17 Apr 2020 12:43:47 +0200
Subject: Re: [PATCH 05/35] drm/amd/display: Remove byte swapping for dmcub abm
 config table
To: christian.koenig@amd.com, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20200416234044.2082886-1-Rodrigo.Siqueira@amd.com>
 <20200416234044.2082886-6-Rodrigo.Siqueira@amd.com>
 <MN2PR12MB4488B2003904110CAE92E166F7D90@MN2PR12MB4488.namprd12.prod.outlook.com>
 <c3f3fef6-6c35-7201-c75e-2a72dca42350@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <9442cdf7-4aef-7831-2609-4610b09e15b8@daenzer.net>
Date: Fri, 17 Apr 2020 12:43:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c3f3fef6-6c35-7201-c75e-2a72dca42350@gmail.com>
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koo, Anthony" <Anthony.Koo@amd.com>, "Wood,
 Wyatt" <Wyatt.Wood@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMC0wNC0xNyAxMToyMiBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFncmVl
ZCwganVzdCB3YW50ZWQgdG8gcmVwbHkgYXMgd2VsbCBzaW5jZSBJIHRoaW5rIHNvbWV0aGluZyBp
cyBub3QKPiBjb3JyZWN0bHkgdW5kZXJzdG9vZCBoZXJlLgo+IAo+IFRoZSBjcHVfdG9fYmUxNigp
IGFuZCBiZTE2X3RvX2NwdSgpIGZ1bmN0aW9ucyB3b3JrIGRpZmZlcmVudCBkZXBlbmRpbmcKPiBv
biB3aGljaCBhcmNoaXRlY3R1cmUvZW5kaWFuZXNzIHlvdXIgYXJlLgo+IAo+IFNvIHRoZXkgc2hv
dWxkIGJlIGEgTk8tT1Agb24geDg2IGlmIGV2ZXJ5dGhpbmcgaXMgZG9uZSByaWdodC4KClRoZSAq
YiplIG1hY3JvcyBhcmVuJ3QgTk9QcyBvbiBsaXR0bGUgZW5kaWFuIGFyY2hpdGVjdHVyZXMgbGlr
ZSB4ODYsCnRoZXkgYXJlIG9uIGJpZyBlbmRpYW4gYXJjaGl0ZWN0dXJlcy4gVmljZSB2ZXJzYSBm
b3IgdGhlICpsKmUgbWFjcm9zLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJl
IGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Bl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK

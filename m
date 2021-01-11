Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860F2F11E8
	for <lists+amd-gfx@lfdr.de>; Mon, 11 Jan 2021 12:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DDB89F3C;
	Mon, 11 Jan 2021 11:52:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 960AB89E59
 for <amd-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 11:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id E14F22A6042;
 Mon, 11 Jan 2021 12:52:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 5rk8souwyV3d; Mon, 11 Jan 2021 12:52:11 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id AE1122A6016;
 Mon, 11 Jan 2021 12:52:11 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kyvkC-000YB6-De; Mon, 11 Jan 2021 12:52:11 +0100
Subject: Re: [PATCH v2] drm/amdgpu:Limit the resolution for virtual_display
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: "Deng, Emily" <Emily.Deng@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20210107032927.660772-1-Emily.Deng@amd.com>
 <BY5PR12MB4115BE023BAF8FE53E2070158FAE0@BY5PR12MB4115.namprd12.prod.outlook.com>
 <CADnq5_N0hYURmnApHxhk3xmY426jyRNCBn97JoNxAq8t3f=Ojw@mail.gmail.com>
 <BY5PR12MB411578DED560A6B45727AA2C8FAB0@BY5PR12MB4115.namprd12.prod.outlook.com>
 <e6fe7c66-6033-9556-dcac-cb5970ce87fe@daenzer.net>
Message-ID: <e21ec168-a4e5-2280-e3bc-42ee11c4476c@daenzer.net>
Date: Mon, 11 Jan 2021 12:52:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e6fe7c66-6033-9556-dcac-cb5970ce87fe@daenzer.net>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMS0wMS0xMSAxMjo1MCBwLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBPbiAyMDIx
LTAxLTExIDU6NTUgYS5tLiwgRGVuZywgRW1pbHkgd3JvdGU6Cj4+IFtBTUQgT2ZmaWNpYWwgVXNl
IE9ubHkgLSBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0KPj4KPj4gWWVzLCBpdCBqdXN0IHdv
bid0IHJlcG9ydCBiaWdnZXIgdGhhbiAxNjM4NCBtb2RlIHRvIHVzZXIgbW9kZSwgYXMgaXQgCj4+
IHdvbid0IHdvcmsgcHJvcGVybHkuCj4gCj4gLi4uIHdpdGggWG9yZyAvIGdsYW1vci4gSXQgZG9l
c24ndCBhZmZlY3Qgb3RoZXIgdXNlci1zcGFjZS4KCkxldCBtZSByZXBocmFzZTogVGhpcyB3b3Vs
ZCBhcnRpZmljaWFsbHkgbGltaXQgb3RoZXIgdXNlci1zcGFjZS4KCgotLSAKRWFydGhsaW5nIE1p
Y2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0
LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAg
TWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cg==

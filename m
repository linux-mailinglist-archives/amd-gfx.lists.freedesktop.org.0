Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C188819F886
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Apr 2020 17:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDCD6E405;
	Mon,  6 Apr 2020 15:09:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2BD256E405
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Apr 2020 15:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 56D002A6045;
 Mon,  6 Apr 2020 17:09:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id i6e8sAF8aDUQ; Mon,  6 Apr 2020 17:09:07 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id C6AEA2A6042;
 Mon,  6 Apr 2020 17:09:06 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jLTN4-000Rff-6R; Mon, 06 Apr 2020 17:09:06 +0200
Subject: Re: [PATCH 30/36] drm/amd/display: Avoid create MST prop after
 registration
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20200405204115.683559-1-Rodrigo.Siqueira@amd.com>
 <20200405204115.683559-31-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <e6066d48-7666-50b6-c3c7-0e910b4ba3d4@daenzer.net>
Date: Mon, 6 Apr 2020 17:09:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200405204115.683559-31-Rodrigo.Siqueira@amd.com>
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
Cc: Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com,
 amd-gfx@lists.freedesktop.org, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Harry.Wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMC0wNC0wNSAxMDo0MSBwLm0uLCBSb2RyaWdvIFNpcXVlaXJhIHdyb3RlOgo+IEZyb206
ICJKZXJyeSAoRmFuZ3poaSkgWnVvIiA8SmVycnkuWnVvQGFtZC5jb20+Cj4gCj4gW1doeV0KPiBQ
cm9wIGFyZSBjcmVhdGVkIGF0IGJvb3Qgc3RhZ2UsIGFuZCBub3QgYWxsb3dlZCB0byBjcmVhdGUg
bmV3IHByb3AKPiBhZnRlciBkZXZpY2UgcmVnaXN0cmF0aW9uLgo+IAo+IFtIb3ddCj4gUmV1c2Ug
dGhlIGNvbm5lY3RvciBwcm9wZXJ0eSBmcm9tIFNTVCBpZiBleGlzdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKZXJyeSAoRmFuZ3poaSkgWnVvIDxKZXJyeS5adW9AYW1kLmNvbT4KPiBSZXZpZXdlZC1i
eTogSGVyc2VuIFd1IDxoZXJzZW54cy53dUBhbWQuY29tPgo+IEFja2VkLWJ5OiBSb2RyaWdvIFNp
cXVlaXJhIDxSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb20+ClRoaXMgcGF0Y2ggaXMgbmVlZGVkIGlu
IDUuNywgb3Igb25lIGdldHMgdGhlIFdBUk5JTkdzIEkgcmVwb3J0ZWQgaW4KaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvYW1kLWdmeC8yMDIwLUFwcmlsLzA0ODAxNy5odG1s
CndoZW4gYW4gTVNUIGRpc3BsYXkgaXMgY29ubmVjdGVkLgoKTm90ZSB0aGF0IHRoaXMgcGF0Y2gg
ZG9lc24ndCBmaXggYWxsIG9mIHRob3NlLCB0aGVyZSdzIGFsc28gb25lCnRyaWdnZXJlZCBieSBk
bV9kcF9hZGRfbXN0X2Nvbm5lY3RvciA9PiBkcm1fZW5jb2Rlcl9pbml0LgoKIGdpdCBncmVwIG1z
dF9lbmNvZGVycyBkcml2ZXJzL2dwdS9kcm0vaTkxNS8KCnNob3dzIGhvdyB0aGUgaTkxNSBkcml2
ZXIgZGVhbHMgd2l0aCB0aGlzLgoKQ2FuIHlvdSBndXlzIHRha2UgY2FyZSBvZiB0aGF0IGZvciA1
LjcgYXMgd2VsbD8KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAg
fCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNp
YXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==

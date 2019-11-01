Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA86EC5DB
	for <lists+amd-gfx@lfdr.de>; Fri,  1 Nov 2019 16:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D93B6F82F;
	Fri,  1 Nov 2019 15:48:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011B66F82F
 for <amd-gfx@lists.freedesktop.org>; Fri,  1 Nov 2019 15:47:58 +0000 (UTC)
X-Originating-IP: 184.64.35.96
Received: from gideon.lan (S0106bc9b6808c827.cg.shawcable.net [184.64.35.96])
 (Authenticated sender: neil@neil.mayhew.name)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4E645FF802
 for <amd-gfx@lists.freedesktop.org>; Fri,  1 Nov 2019 15:47:56 +0000 (UTC)
Subject: Re: [PATCH] drm/amdgpu: Show resolution correctly in mode validation
 debug output
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191030185837.8766-1-neil@neil.mayhew.name>
 <e970ad7b-3ca6-a6a4-ebf0-83b5f6b3b153@amd.com>
From: Neil Mayhew <neil@neil.mayhew.name>
Message-ID: <1b3d267d-7d0a-1fbb-44c5-89d1695e3733@neil.mayhew.name>
Date: Fri, 1 Nov 2019 09:47:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <e970ad7b-3ca6-a6a4-ebf0-83b5f6b3b153@amd.com>
Content-Language: en-CA
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0wMSA5OjEzIGEubS4sIEhhcnJ5IFdlbnRsYW5kIHdyb3RlOgo+IE9uIDIwMTkt
MTAtMzAgMjo1OCBwLm0uLCBuZWlsQG5laWwubWF5aGV3Lm5hbWUgd3JvdGU6Cj4+IEZyb206IE5l
aWwgTWF5aGV3IDxuZWlsQG5laWwubWF5aGV3Lm5hbWU+Cj4gVGhpcyByZXF1aXJlcyB5b3VyIFNp
Z25lZC1vZmYtYnkuIFNlZSBbMV0uCj4KPiBXaXRoIHRoYXQgZml4ZWQgeW91ciBjaGFuZ2UgbG9v
a3MgZ29vZCBhbmQgaXMKPiBSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRs
YW5kQGFtZC5jb20+Cj4KPiBZb3UgY2FuIHNpbXBseSByZXBseSB0byB0aGlzIGVtYWlsIHdpdGgg
eW91ciBTaWduZWQtb2ZmLWJ5IGFuZCBJIGNhbiBhZGQKPiBpdCB3aGVuIG1lcmdpbmcsIG9yIHlv
dSBjYW4gc2VuZCBhIHYyIHBhdGNoIHdpdGggeW91ciBTaWduZWQtb2ZmLWJ5LgoKU2lnbmVkLW9m
Zi1ieTogTmVpbCBNYXloZXcgPG5laWxAbmVpbC5tYXloZXcubmFtZT4KClRoYW5rcywgSGFycnku
Cgo+IFsxXQo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjQuMTcvcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNzaWduLXlvdXItd29yay10aGUtZGV2ZWxvcGVyLXMtY2Vy
dGlmaWNhdGUtb2Ytb3JpZ2luCj4KPiBIYXJyeQo+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPj4gaW5kZXggYTUyZjBi
MTNhMmM4Li5mODAyYzc4NGU2ZjYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+PiBAQCAtNDExNCw4ICs0MTE0LDggQEAg
ZW51bSBkcm1fbW9kZV9zdGF0dXMgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWMKPj4gIAkJcmVzdWx0ID0gTU9ERV9PSzsKPj4gIAllbHNl
Cj4+ICAJCURSTV9ERUJVR19LTVMoIk1vZGUgJWR4JWQgKGNsayAlZCkgZmFpbGVkIERDIHZhbGlk
YXRpb24gd2l0aCBlcnJvciAlZFxuIiwKPj4gLQkJCSAgICAgIG1vZGUtPnZkaXNwbGF5LAo+PiAg
CQkJICAgICAgbW9kZS0+aGRpc3BsYXksCj4+ICsJCQkgICAgICBtb2RlLT52ZGlzcGxheSwKPj4g
IAkJCSAgICAgIG1vZGUtPmNsb2NrLAo+PiAgCQkJICAgICAgZGNfcmVzdWx0KTsKPj4gIAo+PgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

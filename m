Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7008350BC
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 22:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C868920C;
	Tue,  4 Jun 2019 20:15:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7125A8920C
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 20:15:43 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n4so14126636wrs.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 13:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RIf6cjDUVcF9rOMT0Ln1hF5r6WOGvxz9FCqumLU684Y=;
 b=CQhlx4LlbJC8Ptrgs3Cby6csuWGA7lM6z+PQNIoZQUZW5XeXtzDgw9Aj7GJOwIgBBO
 +cLCp/PW2sNPtfEArTC19P6jgbXG/H7DkgeXow/KMSFUiPRt6sIZPaczDNx4kVyDIMJH
 441IJ9XZaKrQ6lu0sn7BgTuMexER9C/qwxajQf0m82U8Nun5GA5OKVH1dudJMW2UsLHf
 GqVDwOh55owe9MLJfmP9oPcul6nrm3kqW32Wh2bYLTqlBl6ZOsu/BCTLCqYB6YMZfJRu
 z+lKGac46JMDth9tYTzVDtoRiaVOD8cRbb3J+vcbdx1d6KyLmpli/ogyAuJjTFIR+ZeL
 Z5wg==
X-Gm-Message-State: APjAAAUNOYaL75r4y8ue6SoEvwNA6mKLhgmz9MJ5YsPr9iayAAfSOlye
 4EdW4jdhUICAbqObcr2nSl0gcdNpet5avtP+AOhe6A==
X-Google-Smtp-Source: APXvYqyMXA3+ZchVM9AhT7XrG5Z4/dhVBHDcMPZZ678Ol7R6RMy+9TaD3Bm0Nn4ge94Ze5Lyypq3dYz4Qi14u7XBL9E=
X-Received: by 2002:adf:e9c4:: with SMTP id l4mr6281005wrn.142.1559679342044; 
 Tue, 04 Jun 2019 13:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190528223811.13947-1-Felix.Kuehling@amd.com>
 <a16cf042-fcb9-21a7-20e4-20c61174f3ff@amd.com>
In-Reply-To: <a16cf042-fcb9-21a7-20e4-20c61174f3ff@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 Jun 2019 16:15:30 -0400
Message-ID: <CADnq5_NKKykmkKp8arYpnim3EEmXWcBHkP9PX0RV4h_waKzSDw@mail.gmail.com>
Subject: Re: [PATCH 0/3] KFD upstreaming
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RIf6cjDUVcF9rOMT0Ln1hF5r6WOGvxz9FCqumLU684Y=;
 b=CBdEOq3n3bpYaAQeR2H5j/8ufJ+zGpy1neqUcMFJB1L7kPZAPaTuwKKHYgXhY6T7oC
 fZCY/P/beieZVAWnsm/mLECX4nSKHXVy/AJmuvn6MgGA0OmsKmbjiq0mvbyKR9rrsGL1
 O58uF2L0iQjKKfPM2DQxw/t6EoiXPCjgR2COp0G4fUmaQTjXXFNl1c67XYXfdD+MuYvG
 n5v9ZiuyK9ZBAtx+GUwx2MQINLuGOLx7aJSSrtS3wzsxTBlt3AKvdXVQWeCaK86wL8XK
 V1XeL+/t89K5sIDno1UPuYuwsCraned/3lkVK7a1Z33TJwo+qYpVoktKx/wgufJ4Moyz
 pJ3w==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCA0OjEyIFBNIEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGVyZSBoYXZlbid0IGJlZW4gYW55IG9iamVjdGlv
bnMgdG8gdGhlc2UgY2hhbmdlcy4gRG9lcyBhbnlvbmUgd2FudCB0bwo+IGFkZCB0aGVpciBBY2tl
ZC1ieSBiZWZvcmUgSSBzdWJtaXQ/CgpTZXJpZXMgaXM6CkFja2VkLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpJIHdvbmRlciBpZiB0aGVyZSBpcyBhIGNoYW5j
ZSB0byBzaGFyZSBhbnkgY29kZSBkb3duIHRoZSByb2FkIHdpdGggdGhlCmNvbnRleHQgcHJpb3Jp
dHkgc3R1ZmYgaW4gYW1kZ3B1LgoKQWxleAoKPgo+IFRoYW5rcywKPiAgICBGZWxpeAo+Cj4gT24g
MjAxOS0wNS0yOCAxODozOCwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOgo+ID4gTmV3IGZlYXR1cmU6
IHF1ZXVlIHByaW9yaXRpZXMKPiA+Cj4gPiBUaGUgZXZpY3Rpb24gc3RhdGUgbG9naWMgY2hhbmdl
IGlzIHByZXBhcmF0aW9uIGZvciBzb21lIGRlYnVnZ2VyIHN1cHBvcnQKPiA+IHdlJ3JlIHdvcmtp
bmcgb24gYnV0IGhhdmVuJ3Qgc2V0dGxlZCBvbiB0aGUgZmluYWwgQUJJIHlldC4KPiA+Cj4gPiBG
ZWxpeCBLdWVobGluZyAoMSk6Cj4gPiAgICBkcm0vYW1ka2ZkOiBTaW1wbGlmeSBldmljdGlvbiBz
dGF0ZSBsb2dpYwo+ID4KPiA+IEpheSBDb3Jud2FsbCAoMSk6Cj4gPiAgICBkcm0vYW1ka2ZkOiBJ
bXBsZW1lbnQgcXVldWUgcHJpb3JpdHkgY29udHJvbHMgZm9yIGdmeDkKPiA+Cj4gPiBvemVuZyAo
MSk6Cj4gPiAgICBkcm0vYW1ka2ZkOiBDUCBxdWV1ZSBwcmlvcml0eSBjb250cm9scwo+ID4KPiA+
ICAgLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgODQgKysr
KysrKysrKy0tLS0tLS0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFk
X21hbmFnZXIuYyAgfCAyMCArKysrKwo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfbXFkX21hbmFnZXIuaCAgfCAgMiArLQo+ID4gICAuLi4vZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9tcWRfbWFuYWdlcl9jaWsuYyAgfCAyNyArKystLS0KPiA+ICAgLi4uL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfbXFkX21hbmFnZXJfdjkuYyAgIHwgMjAgKystLS0KPiA+ICAgLi4uL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdmkuYyAgIHwgMjIgKystLS0KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgIHwgMTYgKysrKwo+ID4gICA3
IGZpbGVzIGNoYW5nZWQsIDExMyBpbnNlcnRpb25zKCspLCA3OCBkZWxldGlvbnMoLSkKPiA+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1445CB2549
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Sep 2019 20:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CCC6F437;
	Fri, 13 Sep 2019 18:41:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3481F6F437
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Sep 2019 18:41:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l11so33011733wrx.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Sep 2019 11:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YA8g+zQg5CrBaibqX6PVOdpMA2WDKuC7dS0KNUvCH2c=;
 b=TjBzV+sOqJNHiFUND+menE9M/B6fteOtacE2hPCqFDnhMmK9hEqTN0PG/SReuqj1uM
 9PSjewXKhhexPjqSGooctou3NNu6LU/+XQZP+xelNXd7+sgihRPev+3DatzzyPRPzVX+
 iHikV6h5MNUm2PFPFBUQKN30T4xfP7Yf1g6btkvhY98Ad2Qt9DD9Q1R01Ub5yQg6lWSO
 Ka1BDKPRH3wse38HufadgN4odbG+pVCG942LamHL7+opnO/7Vw8jppPPcD4bJCNdGvA9
 ke4+VGIsM+Y/slRT8woWKBf0QHessD7G0EvHMG0f7hZhbVjNUz+jcmDCww851rJY6l7k
 x7aA==
X-Gm-Message-State: APjAAAV0fjPKeWUFxTFmtunZudZpKQatkoN5TwthB2xY/IiUYdjSY5YX
 NDiESmzoeZW6rmW0cNl7vfWtp+rjwDucGuf7WDQ6GX8B
X-Google-Smtp-Source: APXvYqxfLkLCHTEXfoisqBL+K2dKVWqjOKgGAfCba8hLext9iY+jemNv53Z6fn+UsYxxiRS5MFmpS4QKzWT56rQlhIQ=
X-Received: by 2002:a5d:6306:: with SMTP id i6mr35690894wru.323.1568400096540; 
 Fri, 13 Sep 2019 11:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190911095615.12055-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190911095615.12055-1-xiaojie.yuan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Sep 2019 14:41:23 -0400
Message-ID: <CADnq5_PjkqU7p3SCked9xag5QPEe1cWL7oJxvO_xcJfqkjdT4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: get gpu info from ip discovery table
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YA8g+zQg5CrBaibqX6PVOdpMA2WDKuC7dS0KNUvCH2c=;
 b=mrOH5yfAPGN9edZXKrBVnjCdH10bsDVtd7tREU8OXDUCRxnHx1KUYzVJxa/phvcLP6
 7Dx/QYAspzKMMieZoybM0PY7WY+BP7/B/o/PaKudXBM4hObGWZb5W3Dw9y7qEEQeuFe1
 FqzAB4heBPJ3DaFmZRrOAbhE3lYU9+IqE0d4QH+oGMfHQnE34iuX6kQMOhlrWM8th/VR
 d7OfLViNmUGZ1Pk6OocTkHMomSZb6wkv9BuGtqWksNbzNa004EJSdFlaRpJ+7UDLCCGj
 iHB1UkZHtZrHZdmEQWYUakcYjRvd/shbiYJKk3sPxfebSD9tI+09fHlKbNBbtfGaJNcn
 PzbQ==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgNTo1NiBBTSBZdWFuLCBYaWFvamllIDxYaWFvamllLll1
YW5AYW1kLmNvbT4gd3JvdGU6Cj4KPiBleGNlcHQgc29jX2JvdW5kaW5nX2JveCB3aGljaCBpcyBu
b3QgaW50ZWdyYXRlZCBpbiBkaXNjb3ZlcnkgdGFibGUgeWV0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBY
aWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDEyICsrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDEzYmQ2YTZiZDhhYS4uNzBlMGYyNGQzN2E4IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IEBAIC0xNDc0
LDYgKzE0NzQsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfcGFyc2VfZ3B1X2luZm9fZnco
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAgICAgICAgICAgICAgICAgICAgICAgKGNv
bnN0IHN0cnVjdCBncHVfaW5mb19maXJtd2FyZV92MV8wICopKGFkZXYtPmZpcm13YXJlLmdwdV9p
bmZvX2Z3LT5kYXRhICsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGUzMl90b19jcHUoaGRyLT5oZWFkZXIudWNvZGVfYXJy
YXlfb2Zmc2V0X2J5dGVzKSk7Cj4KPiArICAgICAgICAgICAgICAgaWYgKGFtZGdwdV9kaXNjb3Zl
cnkgJiYgYWRldi0+YXNpY190eXBlID49IENISVBfTkFWSTEwKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gcGFyc2Vfc29jX2JvdW5kaW5nX2JveDsKPiArCj4gICAgICAgICAgICAgICAg
IGFkZXYtPmdmeC5jb25maWcubWF4X3NoYWRlcl9lbmdpbmVzID0gbGUzMl90b19jcHUoZ3B1X2lu
Zm9fZnctPmdjX251bV9zZSk7Cj4gICAgICAgICAgICAgICAgIGFkZXYtPmdmeC5jb25maWcubWF4
X2N1X3Blcl9zaCA9IGxlMzJfdG9fY3B1KGdwdV9pbmZvX2Z3LT5nY19udW1fY3VfcGVyX3NoKTsK
PiAgICAgICAgICAgICAgICAgYWRldi0+Z2Z4LmNvbmZpZy5tYXhfc2hfcGVyX3NlID0gbGUzMl90
b19jcHUoZ3B1X2luZm9fZnctPmdjX251bV9zaF9wZXJfc2UpOwo+IEBAIC0xNTAxLDcgKzE1MDQs
MTMgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX3BhcnNlX2dwdV9pbmZvX2Z3KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPmdmeC5j
b25maWcubnVtX3BhY2tlcl9wZXJfc2MgPQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbGUzMl90b19jcHUoZ3B1X2luZm9fZnctPm51bV9wYWNrZXJfcGVyX3NjKTsKPiAgICAgICAg
ICAgICAgICAgfQo+ICsKPiArcGFyc2Vfc29jX2JvdW5kaW5nX2JveDoKPiAgI2lmZGVmIENPTkZJ
R19EUk1fQU1EX0RDX0RDTjJfMAo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAg
ICAgKiBzb2MgYm91bmRpbmcgYm94IGluZm8gaXMgbm90IGludGVncmF0ZWQgaW4gZGlzb2NvdmVy
eSB0YWJsZSwKPiArICAgICAgICAgICAgICAgICogd2UgYWx3YXlzIG5lZWQgdG8gcGFyc2UgaXQg
ZnJvbSBncHUgaW5mbyBmaXJtd2FyZS4KPiArICAgICAgICAgICAgICAgICovCj4gICAgICAgICAg
ICAgICAgIGlmIChoZHItPnZlcnNpb25fbWlub3IgPT0gMikgewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBncHVfaW5mb19maXJtd2FyZV92MV8yICpncHVfaW5mb19mdyA9
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoY29uc3Qgc3RydWN0IGdwdV9pbmZv
X2Zpcm13YXJlX3YxXzIgKikoYWRldi0+ZmlybXdhcmUuZ3B1X2luZm9fZnctPmRhdGEgKwo+IEBA
IC0xNjE4LDYgKzE2MjcsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfaXBfZWFybHlfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAgIGlmIChyKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gcjsKPgo+ICsgICAgICAgaWYgKGFtZGdwdV9kaXNjb3ZlcnkgJiYgYWRl
di0+YXNpY190eXBlID49IENISVBfTkFWSTEwKQo+ICsgICAgICAgICAgICAgICBhbWRncHVfZGlz
Y292ZXJ5X2dldF9nZnhfaW5mbyhhZGV2KTsKPiArCj4gICAgICAgICBhbWRncHVfYW1ka2ZkX2Rl
dmljZV9wcm9iZShhZGV2KTsKPgo+ICAgICAgICAgaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkg
ewo+IC0tCj4gMi4yMC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

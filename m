Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE8F3CEF9
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 16:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADB7891C0;
	Tue, 11 Jun 2019 14:39:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64652891C0
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 14:39:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e16so13367138wrn.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 07:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BTJx54qMWGE1LUf6xnOsditWkgimUJCnmEBMyK1zkxk=;
 b=GC5Eu7RoaOhunheGconziRpbk0Rs+Ae8mbboE7d6LNxqZiGVsHa2NhpgbOnkAmU/nI
 XF+u5NBGGv6Gm6Oc8SY7vaEUhRry4tZ2YjbR3vQOnS7lEQbxKeGxxbrzjiWmd280AB0R
 0+umf8//WimF184mpUkar0dixbSmsVFP6NtsoFrrN1Li0M5w1pHRJ1ggNdeArzlaW7Ze
 xBNr/VMWfjNk4rDTimXmc1RN2eFovkdF4i5sBWpF6ztQ9MCQoOMecW85Ic9HX37/dpM4
 H5LgxxKZWqOOI5qHpQsvFo0Y37huuQvws6MZwvIQ9rk9EbyuOs2BvxWb1x1sjRKOJNgA
 9YXg==
X-Gm-Message-State: APjAAAW/EkE3piKrdO4QOBpdKXtBEUQbNCsyA/OY2iovHKjEH+uXMWAc
 tV+CiqgmkV/VOAQpLl2WIl13949FRva1u1+aMzza3tec
X-Google-Smtp-Source: APXvYqx2FCiA5iMYMqOrDXihuQSoVCvmiBcEo5S4t5/iNfgVmVM3Xe+K3Xi2Y28EvwvPeSnmzOEWk2Dvt6TbkXlELn8=
X-Received: by 2002:a5d:6b52:: with SMTP id x18mr28079425wrw.341.1560263946990; 
 Tue, 11 Jun 2019 07:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <1559663079-2448-1-git-send-email-yttao@amd.com>
In-Reply-To: <1559663079-2448-1-git-send-email-yttao@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Jun 2019 10:38:54 -0400
Message-ID: <CADnq5_NNivy551zVWt1AT=0cuBpk38MFs_sdjW+vjVHOm064nA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx9: reset compute ring wptr when gpu reset
To: Yintian Tao <yttao@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BTJx54qMWGE1LUf6xnOsditWkgimUJCnmEBMyK1zkxk=;
 b=K8LV1h73Z9dNLcM4KO+URQyJQi/POaljyp/m1ym+mo32XTVbk5WF3AcCt53binhh4V
 SW3mn4mJq/AWbn/3S0MhYpoPInxCAOObEosqyCoKjVEfFTAuHTKaV6GhpMFAT40YAQI3
 /luEBEzTGf/B1RuTmdHIWJP2DSuZSpDistru0K+RSo7LNfamMCtoGM15gTqkRWLt2DJ9
 K9bB7blNUdp/YgeCefJ0pewNMVzmksP1DMZjHXa4ls7Ibxf1jh1gCgPBkPBpZQE1zMtZ
 nT53oN5ivvKqZ0aDUS4f3VCFIyWvTMHdJ7BUROXuU/f0YdeGXOh/OMFe7XsbZ4XLJCD0
 1Xdg==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCAxMTo0NCBBTSBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNv
bT4gd3JvdGU6Cj4KPiBXZSBuZWVkIHJlc2V0IGNvbXB1dGUgcmluZyB3cHRyIHRvIHplcm8gd2hl
biBncHUgcmVzZXQKPiBpbiBvcmRlciB0byBwcmV2ZW50IENQIGhhbmcuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT4KCkFja2VkLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4gaW5kZXggMmU5Y2FjMS4u
MjUyMTFiYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+IEBAIC0z
MTc1LDYgKzMxNzUsNyBAQCBzdGF0aWMgaW50IGdmeF92OV8wX2tjcV9pbml0X3F1ZXVlKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZykKPgo+ICAgICAgICAgICAgICAgICAvKiByZXNldCByaW5nIGJ1
ZmZlciAqLwo+ICAgICAgICAgICAgICAgICByaW5nLT53cHRyID0gMDsKPiArICAgICAgICAgICAg
ICAgYW1kZ3B1X3Jpbmdfc2V0X3dwdHIocmluZyk7Cj4gICAgICAgICAgICAgICAgIGFtZGdwdV9y
aW5nX2NsZWFyX3JpbmcocmluZyk7Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAg
ICBhbWRncHVfcmluZ19jbGVhcl9yaW5nKHJpbmcpOwo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5n
IGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=

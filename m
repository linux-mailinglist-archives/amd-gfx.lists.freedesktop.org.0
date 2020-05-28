Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF991E6328
	for <lists+amd-gfx@lfdr.de>; Thu, 28 May 2020 16:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2424489A77;
	Thu, 28 May 2020 14:02:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC5A892D2
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 May 2020 14:02:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j198so4582823wmj.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 May 2020 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=99E7XIAULQTH3ZnaOuNdJq5qJ+rZ4vInXJyPN9FnNAQ=;
 b=kDJw5tkqEvuRtPr/ZVK9IAU9dRkFJ8fuABbJm35Dc+ImvMxa2xrZ8G92qdROZTtmSh
 E3AJ5ZMteD8xjaxS+XB47GdBiPvuS1piJmvenWH3JxiV1+jxkhe8+y7B5a5kEhCzbiiv
 RyQ3jEoMYRL9oCqwunanhvCHOCHxB1PuZvFh5FfMV/TPGtE4YUyc1IiJERNVP/Oj+T6L
 f/aCdq+Si8Dqv+IpgLqt0/qhajLtM0jWo8+v5plAq7bVmJBiLeY7StcLyvL5D39WE0gu
 kHc5lr+MgplQ3Q9np/Ttqg1GtRcLDVfe6maFQmMZepgoSpTvvnFArmjjKQ21viGz28O5
 9qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=99E7XIAULQTH3ZnaOuNdJq5qJ+rZ4vInXJyPN9FnNAQ=;
 b=EyQMn/sOJZ0S1l4+ktgqTHg7sPBwmjjUrCR7uQEHKU2O3OtLCOgWRfp56Zgo0YT2rO
 0ktZWBRBByqPv16zqq1YnPP8mOG39e1OwE6cOVPUleCYrQUVMJ19F02dE7QKnpvCB7KT
 BgYoD9q5VlDvfJ0Ln/pKyjQTtYU2WvXeu2+R9aoUULvQgcfhqYsdWvAhl5W1n3PTpkg1
 IbotWEqU3/KP0QW7qeA9peS1ttFIuL09h+tts6KqDilJfpK9ccIAhdTAq8hRPrUF1U9X
 hJC5D7s4JEZm0vDAAcRgmBxw09N/bufT6reALVyv6Hzavjt2ScpEiLS4tkJFUba7Nxgv
 jSog==
X-Gm-Message-State: AOAM531uYka6yFnV7a1qljEZ5Jw55vErHdxYVELChNIl2hMVEQsYeFXx
 uivp3CX7bXk2s3jVPViqgs71bOiu
X-Google-Smtp-Source: ABdhPJyhIbo93KKNerGFRW1ENzfbtjEYkzHDHgUgREbuKAC4LtfndKvu8o3iJnYpg4sqUPnuJzNxcQ==
X-Received: by 2002:a1c:c203:: with SMTP id s3mr3452038wmf.174.1590674571061; 
 Thu, 28 May 2020 07:02:51 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o15sm6803807wmm.31.2020.05.28.07.02.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 May 2020 07:02:50 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Improve the MTYPE comments
To: Yong Zhao <Yong.Zhao@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200527005736.29308-1-Yong.Zhao@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <62bce857-eae5-7dd4-374b-cf4680424fe9@gmail.com>
Date: Thu, 28 May 2020 16:02:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200527005736.29308-1-Yong.Zhao@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjcuMDUuMjAgdW0gMDI6NTcgc2NocmllYiBZb25nIFpoYW86Cj4gVXNlIHdvcmRzIGluc3Rl
YWRzIG9mIGFjcm9ueW0gZm9yIGJldHRlciB1bmRlcnN0YW5kaW5nLgo+Cj4gU2lnbmVkLW9mZi1i
eTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KCkdvb2QgaWRlYSwgUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBp
bmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCB8IDEwICsrKysrLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9k
cm0uaAo+IGluZGV4IGQ2NWY5YjRiYTA1Yy4uMDA3MmRkYjU5NzQ3IDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRn
cHVfZHJtLmgKPiBAQCAtNTY0LDE1ICs1NjQsMTUgQEAgc3RydWN0IGRybV9hbWRncHVfZ2VtX29w
IHsKPiAgICNkZWZpbmUgQU1ER1BVX1ZNX01UWVBFX01BU0sJCSgweGYgPDwgNSkKPiAgIC8qIERl
ZmF1bHQgTVRZUEUuIFByZS1BSSBtdXN0IHVzZSB0aGlzLiAgUmVjb21tZW5kZWQgZm9yIG5ld2Vy
IEFTSUNzLiAqLwo+ICAgI2RlZmluZSBBTURHUFVfVk1fTVRZUEVfREVGQVVMVAkJKDAgPDwgNSkK
PiAtLyogVXNlIE5DIE1UWVBFIGluc3RlYWQgb2YgZGVmYXVsdCBNVFlQRSAqLwo+ICsvKiBVc2Ug
Tm9uIENvaGVyZW50IE1UWVBFIGluc3RlYWQgb2YgZGVmYXVsdCBNVFlQRSAqLwo+ICAgI2RlZmlu
ZSBBTURHUFVfVk1fTVRZUEVfTkMJCSgxIDw8IDUpCj4gLS8qIFVzZSBXQyBNVFlQRSBpbnN0ZWFk
IG9mIGRlZmF1bHQgTVRZUEUgKi8KPiArLyogVXNlIFdyaXRlIENvbWJpbmUgTVRZUEUgaW5zdGVh
ZCBvZiBkZWZhdWx0IE1UWVBFICovCj4gICAjZGVmaW5lIEFNREdQVV9WTV9NVFlQRV9XQwkJKDIg
PDwgNSkKPiAtLyogVXNlIENDIE1UWVBFIGluc3RlYWQgb2YgZGVmYXVsdCBNVFlQRSAqLwo+ICsv
KiBVc2UgQ2FjaGUgQ29oZXJlbnQgTVRZUEUgaW5zdGVhZCBvZiBkZWZhdWx0IE1UWVBFICovCj4g
ICAjZGVmaW5lIEFNREdQVV9WTV9NVFlQRV9DQwkJKDMgPDwgNSkKPiAtLyogVXNlIFVDIE1UWVBF
IGluc3RlYWQgb2YgZGVmYXVsdCBNVFlQRSAqLwo+ICsvKiBVc2UgVW5DYWNoZWQgTVRZUEUgaW5z
dGVhZCBvZiBkZWZhdWx0IE1UWVBFICovCj4gICAjZGVmaW5lIEFNREdQVV9WTV9NVFlQRV9VQwkJ
KDQgPDwgNSkKPiAtLyogVXNlIFJXIE1UWVBFIGluc3RlYWQgb2YgZGVmYXVsdCBNVFlQRSAqLwo+
ICsvKiBVc2UgUmVhZCBXcml0ZSBNVFlQRSBpbnN0ZWFkIG9mIGRlZmF1bHQgTVRZUEUgKi8KPiAg
ICNkZWZpbmUgQU1ER1BVX1ZNX01UWVBFX1JXCQkoNSA8PCA1KQo+ICAgCj4gICBzdHJ1Y3QgZHJt
X2FtZGdwdV9nZW1fdmEgewoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cg==

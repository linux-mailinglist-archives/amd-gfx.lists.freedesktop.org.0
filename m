Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4899FDB3
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 10:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16DA89483;
	Wed, 28 Aug 2019 08:58:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A8189483
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 08:58:28 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id t3so4282093ioj.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 01:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=os5eh5igvbbR26f4JGD2Er82sYqK5zvOJynaoPrmgLk=;
 b=uoVoSG4NaRnqoCWfxsTsKr2bT5D5UnNL+feX+/AZk26O8ohF+VGDVMP/fsvArO95pi
 MRBj2k8JQHlO++1ILJxcxao5rAvm8WeajV4745Jk90beH674U1TQpuhfSWllsDsifNeZ
 QlQY35Ct4+e8Lz/V3PmRbtCzkNwI99my4DM+aT9H6Sf+Ok3wMBD9jApN1/eFxVe2fYe7
 VbmYW1ReQYyxyREEnmLCyHvR8S4RYPY4LJuD+KYDwXf6fUqzdbyWFKBQvIh5pOrX4jyx
 XQ0Ejq6KXX0twcCvKEr1eio4ZhW2HfgFuy6auFlvlS4+8uGdfwcdfAizwShnMwQimnD+
 ltIQ==
X-Gm-Message-State: APjAAAWlds4eqkAbzu9WekXxTWYlE9zYcAPjAkO0fswA6xDiwCk4UBtW
 tThHeTZfhOSp5ffTq//vNQi3SgcsSZvmrb3OjJc=
X-Google-Smtp-Source: APXvYqzYlUpm/yc2F73BmH3gGF65XRnSujROSPR1EgunW4hgTW3XRbpUShnXfEeiruwRHmBd0rYAFEDNIKLazgtlUg0=
X-Received: by 2002:a5d:96cb:: with SMTP id r11mr3122243iol.200.1566982708013; 
 Wed, 28 Aug 2019 01:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <1566929823-17398-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1566929823-17398-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Wed, 28 Aug 2019 10:58:16 +0200
Message-ID: <CAD=4a=XNfU9sAoNBQ8-Ou_nXR19F1jorvd9XpM_f1U9HLS3VTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Handle job is NULL use case in
 amdgpu_device_gpu_recover
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=os5eh5igvbbR26f4JGD2Er82sYqK5zvOJynaoPrmgLk=;
 b=YgIXYScDETMbW/5CTx2Q1uUwAQ8M5AK4dthGtQaijTe0CPbtTvRr1AU5gchCS1h/ss
 5TWdj50BxP+ZT9z4dVOhoy6I1KRFVKpqMgKl07YtfSLbp8vassZilg1+ydpGvvu3lGGK
 7Q0b/Y2QaoZBlbwdHtXoCHqFkTQ2FyiabGSlZ/o+4QLU5Pn2bjkO+eRlbZ/A7kvMdvkw
 KgyVs79QB7F77bTAyxQSwKut/gMSFDGhu0ftitWA2jaPsZvIvouORaC1tOXwbiIM9HSS
 FJ5sEFVH4SJRC+Gs9CYq+m+MAn0+RaxZ4EM00+qtd+tRJFaCycT+UE24CME1xmDIzKwl
 J0jw==
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RGVuIHRpcyAyNyBhdWcuIDIwMTkga2wgMjA6MTcgc2tyZXYgQW5kcmV5IEdyb2R6b3Zza3kKPGFu
ZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ogo+Cj4gVGhpcyBzaG91bGQgYmUgY2hlY2tlZCBhdCBh
bGwgcGxhY2VzIGpvYiBpcyBhY2Nlc3NlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9k
em92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5kZXggMDJiM2U3ZC4uMTkwZDlhMyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBAQCAtMzc5
MCwxNCArMzc5MCwxNCBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKPgo+ICAgICAgICAgaWYgKGhpdmUgJiYgIW11dGV4X3RyeWxvY2so
JmhpdmUtPnJlc2V0X2xvY2spKSB7Cj4gICAgICAgICAgICAgICAgIERSTV9JTkZPKCJCYWlsaW5n
IG9uIFREUiBmb3Igc19qb2I6JWxseCwgaGl2ZTogJWxseCBhcyBhbm90aGVyIGFscmVhZHkgaW4g
cHJvZ3Jlc3MiLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICBqb2ItPmJhc2UuaWQsIGhpdmUt
PmhpdmVfaWQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgam9iID8gam9iLT5iYXNlLmlk
IDogLTEsIGhpdmUtPmhpdmVfaWQpOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAg
ICAgIH0KPgo+ICAgICAgICAgLyogU3RhcnQgd2l0aCBhZGV2IHByZSBhc2ljIHJlc2V0IGZpcnN0
IGZvciBzb2Z0IHJlc2V0IGNoZWNrLiovCj4gICAgICAgICBpZiAoIWFtZGdwdV9kZXZpY2VfbG9j
a19hZGV2KGFkZXYsICFoaXZlKSkgewo+ICAgICAgICAgICAgICAgICBEUk1fSU5GTygiQmFpbGlu
ZyBvbiBURFIgZm9yIHNfam9iOiVsbHgsIGFzIGFub3RoZXIgYWxyZWFkeSBpbiBwcm9ncmVzcyIs
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBqb2ItPmJhc2UuaWQp
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgam9iID8gam9iLT5iYXNlLmlkIDogLTEpOwo+
ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPgo+IEBAIC0zODM4LDcgKzM4
MzgsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJpbmcgfHwgIXJpbmctPnNj
aGVkLnRocmVhZCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZHJtX3NjaGVkX3N0b3AoJnJpbmctPnNjaGVkLCAm
am9iLT5iYXNlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBkcm1fc2NoZWRfc3RvcCgmcmlu
Zy0+c2NoZWQsIGpvYiA/ICZqb2ItPmJhc2UgOiBOVUxMKTsKPiAgICAgICAgICAgICAgICAgfQo+
ICAgICAgICAgfQo+Cj4gQEAgLTM4NjQsNyArMzg2NCw3IEBAIGludCBhbWRncHVfZGV2aWNlX2dw
dV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+Cj4gICAgICAgICAvKiBHdWls
dHkgam9iIHdpbGwgYmUgZnJlZWQgYWZ0ZXIgdGhpcyovCj4gICAgICAgICByID0gYW1kZ3B1X2Rl
dmljZV9wcmVfYXNpY19yZXNldChhZGV2LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgam9iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgam9iID8gam9iIDogTlVMTCwKClRoaXMgY2hlY2sgbG9va3MgcmVkdW5kYW50LgoKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZuZWVkX2Z1bGxfcmVzZXQpOwo+
ICAgICAgICAgaWYgKHIpIHsKPiAgICAgICAgICAgICAgICAgLypUT0RPIFNob3VsZCB3ZSBzdG9w
ID8qLwo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeAoKUmVnYXJkcwovL0VybnN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==

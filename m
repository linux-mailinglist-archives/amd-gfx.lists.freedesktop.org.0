Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C961A12AA
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 09:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634B489FC3;
	Thu, 29 Aug 2019 07:33:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E7789FC3
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 07:33:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y135so1391259wmc.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 00:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XFaTWEXctDjcCl9V0pcgqlBsYqhKnHJ+1r7pEbCe9mE=;
 b=JbTm3cCQWGU8Vf4EqqqC4IgJMAIK77xsvCv41BBIWbKqNxCWVwubbXBLdwugr5hjCD
 XZ6EmsBhkmTLxUCX78YCfQBtTJutw2kLwMKFdq1BjzUPZKfHtlZhUDNFhwphF42GGilF
 lJVe/oXNyiX0RzpJbgkxRFd37/I/onGN8j55xesJiVO5jyZ+h15H7rkHNlMG3kbfRr9e
 ZMQifwn+K5CzLais/Lq1qZnPFKpRldXubmCzO3i/JobI63Qlmwdu74MFEhoT4k1SCkfM
 QUFhFm+0VTjgJO9ZvpJhQinp9at7/878Y8MyANqZGVcVqlNJK1JmbmLafy3CJqsAKQ1p
 5NrQ==
X-Gm-Message-State: APjAAAViv6PEA8EaRitwEggo7t/z2LMcXdcy19pCGgOMPHWiNKSVx4Jy
 MOTRNRjQ49xf8R+gtd+8odc=
X-Google-Smtp-Source: APXvYqzxi30tygw+xST6AXyBuNjrBXDnunHCx83EjtqDz4PY5OsX2nZSmjgX1gF3iYxEbcRtwkolyQ==
X-Received: by 2002:a7b:cd0f:: with SMTP id f15mr9844259wmj.86.1567064006713; 
 Thu, 29 Aug 2019 00:33:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d17sm2492999wre.27.2019.08.29.00.33.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 00:33:26 -0700 (PDT)
Subject: Re: [PATCH 2/2] dmr/amdgpu: Add system auto reboot to RAS.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <1567022426-6612-1-git-send-email-andrey.grodzovsky@amd.com>
 <1567022426-6612-2-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a78daf14-7a90-737f-7151-97dd2dbccc80@gmail.com>
Date: Thu, 29 Aug 2019 09:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567022426-6612-2-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XFaTWEXctDjcCl9V0pcgqlBsYqhKnHJ+1r7pEbCe9mE=;
 b=HLbuTSFqtXnrgNl3K5e1emph2d5DWpBOdArgzL2dJFMVmZeIDeWfw4mm9lEyR8TREO
 8zP1JXBv88R7uiS0SILFyKb2RYsIzTap5JA7x5vx85+7ogw2Snw9Gsr3wA1Vp9dwYmsX
 tvwTEp7Ik83vB6HXcOILGWzlSD+inHnOxgHa8VRJbcoOM36TrtMvo3ynqyjUki27JH6j
 37/fG3T09BJxP5ZMxHwFqh/0BS48TwfBPOUkZ9JR5veCMVKCA/XoIU0Cm0MwZtS+ZtPv
 xHsvIqPYCEU8zO7DWI3hqUlwX5oHpvoGmIfufik3qfa528XtFFM6RnDKlXdylaCDTL86
 RPwA==
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
Reply-To: christian.koenig@amd.com
Cc: alexdeucher@gmail.com, Hawking.Zhang@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjguMDguMTkgdW0gMjI6MDAgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBJbiBjYXNl
IG9mIFJBUyBlcnJvciBhbGxvdyB1c2VyIGNvbmZpZ3VyZSBhdXRvIHN5c3RlbQo+IHJlYm9vdCB0
aHJvdWdoIHJhc19jdHJsLgo+IFRoaXMgaXMgYWxzbyBwYXJ0IG9mIHRoZSB0ZW1wcm9yYXkgd29y
ayBhcm91bmQgZm9yIHRoZSBSQVMKPiBoYW5nIHByb2JsZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPiAtLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDE4ICsrKysrKysrKysr
KysrKysrKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jICAgIHwg
MTAgKysrKysrKysrLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5o
ICAgIHwgIDEgKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4g
aW5kZXggM2VjZWUxMC4uZjFjZmY0NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMKPiBAQCAtMzgwNSw2ICszODA1LDI0IEBAIGludCBhbWRncHVfZGV2
aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCWludCBpLCBy
ID0gMDsKPiAgIAlib29sIGluX3Jhc19pbnRyID0gYW1kZ3B1X3Jhc19pbnRyX3RyaWdnZXJlZCgp
Owo+ICAgCj4gKwkvKgo+ICsJICogRmx1c2ggUkFNIHRvIGRpc2sgc28gdGhhdCBhZnRlciByZWJv
b3QKPiArCSAqIHRoZSB1c2VyIGNhbiByZWFkIGxvZyBhbmQgc2VlIHdoeSB0aGUgc3lzdGVtIHJl
Ym9vdGVkLgo+ICsJICoKPiArCSAqIFVzaW5nIHVzZXIgbW9kZSBhcHAgY2FsbCBpbnN0ZWFkIG9m
IGtlcm5lbCBBUElzIHN1Y2ggYXMKPiArCSAqIGtzeXNfc3luY19oZWxwZXIgZm9yIGJhY2t3YXJk
IGNvbXBhcmFiaWxpdHkgd2l0aCBlYXJsaWVyCj4gKwkgKiBrZXJuZWxzIGludG8gd2hpY2ggdGhp
cyBpcyBhbHNvIGludGVuZGVkLgo+ICsJICovCj4gKwlpZiAoaW5fcmFzX2ludHIgJiYgYW1kZ3B1
X3Jhc19nZXRfY29udGV4dChhZGV2KS0+cmVib290KSB7Cj4gKwkJY2hhciAqZW52cFtdID0geyAi
SE9NRT0vIiwgTlVMTCB9Owo+ICsJCWNoYXIgKmFyZ3ZbXSA9IHsgIi9iaW4vc3luYyIsIE5VTEwg
fTsKPiArCj4gKwkJRFJNX1dBUk4oIkVtZXJnZW5jeSByZWJvb3QuIik7Cj4gKwo+ICsJCWNhbGxf
dXNlcm1vZGVoZWxwZXIoYXJndlswXSwgYXJndiwgZW52cCwgVU1IX1dBSVRfUFJPQyk7Cj4gKwkJ
ZW1lcmdlbmN5X3Jlc3RhcnQoKTsKPiArCX0KPiArCj4gICAJbmVlZF9mdWxsX3Jlc2V0ID0gam9i
X3NpZ25hbGVkID0gZmFsc2U7Cj4gICAJSU5JVF9MSVNUX0hFQUQoJmRldmljZV9saXN0KTsKPiAg
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBpbmRleCAwODZlNmRm
Li40MjNhMWJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+
IEBAIC0zMCw2ICszMCw3IEBACj4gICAjaW5jbHVkZSAiYW1kZ3B1X3Jhcy5oIgo+ICAgI2luY2x1
ZGUgImFtZGdwdV9hdG9tZmlybXdhcmUuaCIKPiAgICNpbmNsdWRlICJpdnNyY2lkL25iaW8vaXJx
c3Jjc19uYmlmXzdfNC5oIgo+ICsjaW5jbHVkZSA8bGludXgva21vZC5oPgo+ICAgCj4gICBjb25z
dCBjaGFyICpyYXNfZXJyb3Jfc3RyaW5nW10gPSB7Cj4gICAJIm5vbmUiLAo+IEBAIC0xNTQsNiAr
MTU1LDggQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9wYXJzZV9kYXRhKHN0
cnVjdCBmaWxlICpmLAo+ICAgCQlvcCA9IDE7Cj4gICAJZWxzZSBpZiAoc3NjYW5mKHN0ciwgImlu
amVjdCAlMzJzICU4cyIsIGJsb2NrX25hbWUsIGVycikgPT0gMikKPiAgIAkJb3AgPSAyOwo+ICsJ
ZWxzZSBpZiAoc3NjYW5mKHN0ciwgInJlYm9vdCAlMzJzIiwgYmxvY2tfbmFtZSkgPT0gMSkKPiAr
CQlvcCA9IDM7Cj4gICAJZWxzZSBpZiAoc3RyWzBdICYmIHN0clsxXSAmJiBzdHJbMl0gJiYgc3Ry
WzNdKQo+ICAgCQkvKiBhc2NpaSBzdHJpbmcsIGJ1dCBjb21tYW5kcyBhcmUgbm90IG1hdGNoZWQu
ICovCj4gICAJCXJldHVybiAtRUlOVkFMOwoKVGhpcyBpcyBhY3R1YWxseSBiZWNvbWluZyBxdWl0
ZSBhIG1lc3MuIFdlIHNob3VsZCBjb25zaWRlciByZW1vdmluZyB0aGUgCnBhcnNpbmcgaW4gdGhl
IGxvbmcgdGVybSBhbmQgdXNpbmcgc2VwYXJhdGUgZGVidWdmcyBmaWxlcyBmb3IgZWFjaCBhY3Rp
b24uCgpDaHJpc3RpYW4uCgo+IEBAIC0yODcsNiArMjkwLDkgQEAgc3RhdGljIHNzaXplX3QgYW1k
Z3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191
c2VyICoKPiAgIAkJLyogZGF0YS5pbmplY3QuYWRkcmVzcyBpcyBvZmZzZXQgaW5zdGVhZCBvZiBh
YnNvbHV0ZSBncHUgYWRkcmVzcyAqLwo+ICAgCQlyZXQgPSBhbWRncHVfcmFzX2Vycm9yX2luamVj
dChhZGV2LCAmZGF0YS5pbmplY3QpOwo+ICAgCQlicmVhazsKPiArCWNhc2UgMzoKPiArCQlhbWRn
cHVfcmFzX2dldF9jb250ZXh0KGFkZXYpLT5yZWJvb3QgPSB0cnVlOwo+ICsJCWJyZWFrOwo+ICAg
CWRlZmF1bHQ6Cj4gICAJCXJldCA9IC1FSU5WQUw7Cj4gICAJCWJyZWFrOwo+IEBAIC0xNzMzLDYg
KzE3MzksOCBAQCBpbnQgYW1kZ3B1X3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQo+ICAgdm9pZCBhbWRncHVfcmFzX2dsb2JhbF9yYXNfaXNyKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQo+ICAgewo+ICAgCWlmIChhdG9taWNfY21weGNoZygmYW1kZ3B1X3Jhc19pbl9pbnRy
LCAwLCAxKSA9PSAwKSB7Cj4gLQkJRFJNX1dBUk4oIlJBUyBldmVudCBvZiB0eXBlIEVSUkVWRU5U
X0FUSFVCX0lOVEVSUlVQVCBkZXRlY3RlZCEgU3RvcHBpbmcgYWxsIEdQVSBqb2JzLlxuIik7Cj4g
KwkJRFJNX1dBUk4oIlJBUyBldmVudCBvZiB0eXBlIEVSUkVWRU5UX0FUSFVCX0lOVEVSUlVQVCBk
ZXRlY3RlZCFcbiIpOwo+ICsKPiArCQlhbWRncHVfcmFzX3Jlc2V0X2dwdShhZGV2LCBmYWxzZSk7
Cj4gICAJfQo+ICAgfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKPiBp
bmRleCBjMGUyMmFmLi5lM2YwNzY0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuaAo+IEBAIC0zMzMsNiArMzMzLDcgQEAgc3RydWN0IGFtZGdwdV9yYXMgewo+ICAg
CXN0cnVjdCBtdXRleCByZWNvdmVyeV9sb2NrOwo+ICAgCj4gICAJdWludDMyX3QgZmxhZ3M7Cj4g
Kwlib29sIHJlYm9vdDsKPiAgIH07Cj4gICAKPiAgIHN0cnVjdCByYXNfZnNfZGF0YSB7CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C39B882C
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 01:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D726F568;
	Thu, 19 Sep 2019 23:41:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD316F568
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 23:40:59 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-ooYm-pU-MtWKlRqhKjoaoQ-1; Thu, 19 Sep 2019 19:40:57 -0400
Received: by mail-qk1-f199.google.com with SMTP id n135so5902312qke.23
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 16:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=wDCcCIAxZTP4NhEBKZatXOJR721Ut/RVgMMWm1PgCrs=;
 b=Fn9/sHcZQYJMhudOoxoPhx9+lAQNxRXHrEhmv3RI6eAPYzpjOpl5unO/D9VRqe7Mdu
 JCMYXKw10cmSXZEsFG3SAP4aYelKnzt5d6Yq0+1xrgHs0FJksSBJxhCZudg+cRTOAfUP
 eVoLJAn0qOzx4RoP/fEiXJJtL6x9Bqlh7Mr6GP2cmqhQyZhJsv0N5g9eroLYeDDJjeL1
 LbFh6VdjYiWJGsiI8g27udfFS9L9VDvuEJyLPjs/NIFQPnfbi/X9TpiwAa7Z/7vksQGN
 p/opNT34OyMLjleFE38PjveVWwLPynUMscRyv3x7FLi4AHuvPCweqOr7BCuDSjx8675M
 7Qyg==
X-Gm-Message-State: APjAAAVIdtS0jljKVCLFQEPZ5BLw2waxiD0lvn7JGrXBUVh6Tot/FczD
 a6pqUYyhv/A15eSbYNIESMzWZ7qCqMAt0hyBJittbuXBC3k7JY205pQVovVzXJreBFcRPJqxk33
 9jhBs2tgtrkb4kECGgEjuQsHBfA==
X-Received: by 2002:a37:a858:: with SMTP id r85mr435313qke.394.1568936456349; 
 Thu, 19 Sep 2019 16:40:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3VDWf5w6Zor/vmdby4Uefrvj0LD87n0PkanNg5+e6PhZTSML+tJckVU559VL8o9vW12XD0g==
X-Received: by 2002:a37:a858:: with SMTP id r85mr435304qke.394.1568936456183; 
 Thu, 19 Sep 2019 16:40:56 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id x12sm88240qtb.32.2019.09.19.16.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 16:40:55 -0700 (PDT)
Message-ID: <7893bf17824cf350b7d4aee2fe6afafd5220a1fc.camel@redhat.com>
Subject: Re: [PATCH 03/15] drm/amdgpu: validate mst topology in atomic check
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Thu, 19 Sep 2019 19:40:55 -0400
In-Reply-To: <12913419239b363a0c20c0c013b2dc3cfd4effb6.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
 <12913419239b363a0c20c0c013b2dc3cfd4effb6.1568833906.git.mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: ooYm-pU-MtWKlRqhKjoaoQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1568936458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVzZEwIahpuEbxatSNR+XUr/8Kr7c5LSTvQnbXWzQA4=;
 b=grjKdFiGUgqHFqWYpKWFGI2UL9EF8PxREEIj8I3ioN6nVqrNvQmfKo37NUZG0YpmTlU8v/
 Oi+5+3LvdI3U4vVK1HL8Gcp6TTehfJCI6s7bIPCQWPSGzbQo5kSE7w/9R+GdpyGYtaY5bc
 CUqjuNJFxV3tFJMvX5mOPtdaMJKXXVM=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBhbHNvIG5lZWRzIHRvIGJlIHNxdWFzaGVkIGludG8gdGhlIHByZXZpb3VzIHR3byBwYXRj
aGVzLiBUaGVyZSdzIG5vIHBvaW50CmluIHVzaW5nIGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Ns
b3RzKCkgb3IgZHJtX2RwX2F0b21pY19yZWxlYXNlX3ZjcGlfc2xvdHMoKQp3aXRob3V0IGRybV9k
cF9tc3RfYXRvbWljX2NoZWNrKCksIHNpbmNlIHRoZSBWQ1BJIGFsbG9jYXRpb25zIHNldHVwIGJ5
IHRoZSB0d28KZnVuY3Rpb25zIGFyZW4ndCB2YWxpZGF0ZWQgdW50aWwgdGhlbi4KCk9uIFdlZCwg
MjAxOS0wOS0xOCBhdCAxNjoyNiAtMDQwMCwgbWlraXRhLmxpcHNraUBhbWQuY29tIHdyb3RlOgo+
IEZyb206IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KPiAKPiBbd2h5XQo+
IFZhbGlkYXRlIG1zdCB0b3BvbG9neSBhbmQgdGhlIG51bWJlciBvZiBWQ1BJIHNsb3RzIGF2YWls
YWJsZQo+IGZvciBhIG5ldyBzdGF0ZS4gRmFpbCBpZiB0b3BvbG9neSBoYXMgbm8gbW9yZSBiYW5k
d2lkdGggZm9yCj4gYSBuZXcgc3RhdGUuCj4gW2hvd10KPiBQYXNzIHRoZSBhdG9taWMgc3RhdGUg
dG8gZHJtX2RwX21zdF9hdG9taWNfY2hlY2sgdG8gdmVyaWZ5Cj4gaWYgdGhlIG5ldyB0b3BvbG9n
eSBpcyBwb3NzaWJsZS4KPiAKPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA1
ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IGluZGV4
IGQ3MDBiOTYyZDMzOC4uMzljMjM5YTA4NjMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAgLTc0ODUsNiArNzQ4NSwx
MSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UK
PiAqZGV2LAo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGZhaWw7Cj4gIAo+ICsJLyogUGVyZm9ybSB2
YWxpZGF0aW9uIG9mIE1TVCB0b3BvbG9neSBpbiB0aGUgc3RhdGUqLwo+ICsJcmV0ID0gZHJtX2Rw
X21zdF9hdG9taWNfY2hlY2soc3RhdGUpOwo+ICsJaWYgKHJldCkKPiArCQlnb3RvIGZhaWw7Cj4g
Kwo+ICAJaWYgKHN0YXRlLT5sZWdhY3lfY3Vyc29yX3VwZGF0ZSkgewo+ICAJCS8qCj4gIAkJICog
VGhpcyBpcyBhIGZhc3QgY3Vyc29yIHVwZGF0ZSBjb21pbmcgZnJvbSB0aGUgcGxhbmUgdXBkYXRl
Ci0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=

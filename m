Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6D7278CB
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 11:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC41989D2F;
	Thu, 23 May 2019 09:06:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27314897E9;
 Thu, 23 May 2019 09:06:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b18so5332061wrq.12;
 Thu, 23 May 2019 02:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tNq2cJ72q17APk9oRDgetyONuoJVGK9rJ/W/Hqg3u6g=;
 b=jc9NCzZXfvoLV2hUkl0DNcJq3jdJC9kOgOBoVtefz0ax9xB4ZjxJpAIOUbvUcUanZQ
 XEReXNaYbdT9S/hpir+YNhxUImJHk9dH671rSXG+zBfBZTqacxOFbRTxvwbE2Fa4LmQ8
 Sz5ey1RjlPfROCQMPm7RUDuYTY5OtjwCeTTR8xxXFK2Ch1Dur8kGZ/vlc/JhVgcAP3L/
 bKUnV0qe8hm7mc9v2O+NmLnq6mApSNt5QERA11BUsTSEKK1bDn4uVn/n9JCnWdKnzAXQ
 IKgpw5zs38nWbftQo/fk+C+aVslINySnuzkl6GH1acjSDHMxBoTU1hF0UJRAABE3pBNm
 GcWA==
X-Gm-Message-State: APjAAAUER30OC7swvI11wAIRyAFAzf9c1PHICFDN5kFXZ6JIn6aS1pXI
 QyxCp0nb59ngGwYmgqV4DYGMeY57
X-Google-Smtp-Source: APXvYqyphIj/J9E4fbLytNCQSJf/UlFZeLQR5aD1UJxg5dPmD9kXPP/XmSKUq7cO+KIMYrx9pn2mfw==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr1853921wrm.228.1558602415584; 
 Thu, 23 May 2019 02:06:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x6sm40644107wru.36.2019.05.23.02.06.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 02:06:55 -0700 (PDT)
Subject: Re: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190522125947.4592-1-christian.koenig@amd.com>
 <20190522125947.4592-10-christian.koenig@amd.com>
 <48ac98a8-de22-3549-5d63-078a0effab72@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <eea6245e-616d-eb16-8521-2f21ce5d6d25@gmail.com>
Date: Thu, 23 May 2019 11:06:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <48ac98a8-de22-3549-5d63-078a0effab72@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tNq2cJ72q17APk9oRDgetyONuoJVGK9rJ/W/Hqg3u6g=;
 b=Iq5ThE8+bZjFYu74AqkfoEhxtndhaN2y2HOeRTChUG5J6M512Uvj840yFkZURJbLqB
 mYkm0AYWsRGt/KjGI6djdC3VEghMeXMYxdetWq3nGTdq0lO5KCYPsX+jiufk0Anvn/SP
 I0+VPghxpOvG6Yxd+6unLeojbtxPZ2zYHtMCfgJoa6LFz9/+lMsbvd0VK6WsWSRcmVoy
 TUcZ/h9efInm65iNOda3WAkR7GjI8DrF/rhB35zQNDMQnxi2Er4DCSz1WxyKOyyxxvLC
 +7uk7cr5sN+fnpzE6WE2+mey1jH4PBRVPkQ0gr1lmc83wW1keqKUV8mmwk1lsRKNCvYp
 YUqQ==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TGVhdmluZyBCT3Mgb24gdGhlIExSVSBpcyBoYXJtbGVzcy4gV2UgYWx3YXlzIGRpZCB0aGlzIGZv
ciBWTSBwYWdlIHRhYmxlIAphbmQgcGVyIFZNIEJPcy4KClRoZSBrZXkgcG9pbnQgaXMgdGhhdCBC
T3Mgd2hpY2ggY291bGRuJ3QgYmUgcmVzZXJ2ZWQgY2FuJ3QgYmUgZXZpY3RlZC4gClNvIHdoYXQg
aGFwcGVuZWQgaXMgdGhhdCBhbiBhcHBsaWNhdGlvbiB1c2VkIGJhc2ljYWxseSBhbGwgb2YgVlJB
TSAKZHVyaW5nIENTIGFuZCBiZWNhdXNlIG9mIHRoaXMgWCBzZXJ2ZXIgY291bGRuJ3QgcGluIGEg
Qk8gZm9yIHNjYW5vdXQuCgpOb3cgd2Uga2VlcCB0aGUgQk9zIG9uIHRoZSBMUlUgYW5kIG1vZGlm
eSBUVE0gdG8gYmxvY2sgZm9yIHRoZSBDUyB0byAKY29tcGxldGUsIHdoaWNoIGluIHR1cm4gYWxs
b3dzIHRoZSBYIHNlcnZlciB0byBwaW4gaXRzIEJPIGZvciBzY2Fub3V0LgoKQ2hyaXN0aWFuLgoK
QW0gMjIuMDUuMTkgdW0gMjE6NDMgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gQ2FuIHlvdSBl
eHBsYWluIGhvdyB0aGlzIGF2b2lkcyBPT00gc2l0dWF0aW9ucz8gV2hlbiBpcyBpdCBzYWZlIHRv
IGxlYXZlCj4gYSByZXNlcnZlZCBCTyBvbiB0aGUgTFJVIGxpc3Q/IENvdWxkIHdlIGRvIHRoZSBz
YW1lIHRoaW5nIGluCj4gYW1kZ3B1X2FtZGtmZF9ncHV2bS5jPyBBbmQgaWYgd2UgZGlkLCB3aGF0
IHdvdWxkIGJlIHRoZSBleHBlY3RlZCBzaWRlCj4gZWZmZWN0cyBvciBjb25zZXF1ZW5jZXM/Cj4K
PiBUaGFua3MsCj4gICDCoCBGZWxpeAo+Cj4gT24gMjAxOS0wNS0yMiA4OjU5IGEubS4sIENocmlz
dGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0KPj4KPj4gVGhp
cyBhdm9pZHMgT09NIHNpdHVhdGlvbnMgd2hlbiB3ZSBoYXZlIGxvdHMgb2YgdGhyZWFkcwo+PiBz
dWJtaXR0aW5nIGF0IHRoZSBzYW1lIHRpbWUuCj4+Cj4+IHYzOiBhcHBseSB0aGlzIHRvIHRoZSB3
aG9sZSBkcml2ZXIsIG5vdCBqdXN0IENTCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICAgICB8IDIgKy0KPj4gICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jICAgIHwgMiArLQo+PiAgICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgICAgfCA0ICsrLS0KPj4gICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHwgMiArLQo+PiAgICA0IGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2NzLmMKPj4gaW5kZXggMjBmMjk1NWQyYTU1Li4zZTJkYTI0Y2QxN2Eg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCj4+IEBAIC02NDgs
NyArNjQ4LDcgQEAgc3RhdGljIGludCBhbWRncHVfY3NfcGFyc2VyX2JvcyhzdHJ1Y3QgYW1kZ3B1
X2NzX3BhcnNlciAqcCwKPj4gICAgICAgICAgIH0KPj4KPj4gICAgICAgICAgIHIgPSB0dG1fZXVf
cmVzZXJ2ZV9idWZmZXJzKCZwLT50aWNrZXQsICZwLT52YWxpZGF0ZWQsIHRydWUsCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmR1cGxpY2F0ZXMsIHRydWUpOwo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkdXBsaWNhdGVzLCBmYWxzZSk7Cj4+ICAg
ICAgICAgICBpZiAodW5saWtlbHkociAhPSAwKSkgewo+PiAgICAgICAgICAgICAgICAgICBpZiAo
ciAhPSAtRVJFU1RBUlRTWVMpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9S
KCJ0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzIGZhaWxlZC5cbiIpOwo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2NzYS5jCj4+IGluZGV4IDA2ZjgzY2FjMGQzYS4uZjY2MDYyOGU2YWY5
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jCj4+IEBAIC03
OSw3ICs3OSw3IEBAIGludCBhbWRncHVfbWFwX3N0YXRpY19jc2Eoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAo+PiAgICAgICAgICAgbGlzdF9hZGQoJmNz
YV90di5oZWFkLCAmbGlzdCk7Cj4+ICAgICAgICAgICBhbWRncHVfdm1fZ2V0X3BkX2JvKHZtLCAm
bGlzdCwgJnBkKTsKPj4KPj4gLSAgICAgICByID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlj
a2V0LCAmbGlzdCwgdHJ1ZSwgTlVMTCwgdHJ1ZSk7Cj4+ICsgICAgICAgciA9IHR0bV9ldV9yZXNl
cnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIHRydWUsIE5VTEwsIGZhbHNlKTsKPj4gICAgICAg
ICAgIGlmIChyKSB7Cj4+ICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiZmFpbGVkIHRvIHJl
c2VydmUgQ1NBLFBEIEJPczogZXJyPSVkXG4iLCByKTsKPj4gICAgICAgICAgICAgICAgICAgcmV0
dXJuIHI7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPj4gaW5kZXgg
ZDUxM2E1YWQwM2RkLi5lZDI1YTRlMTQ0MDQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2VtLmMKPj4gQEAgLTE3MSw3ICsxNzEsNyBAQCB2b2lkIGFtZGdwdV9nZW1f
b2JqZWN0X2Nsb3NlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+Pgo+PiAgICAgICAgICAg
YW1kZ3B1X3ZtX2dldF9wZF9ibyh2bSwgJmxpc3QsICZ2bV9wZCk7Cj4+Cj4+IC0gICAgICAgciA9
IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIGZhbHNlLCAmZHVwbGljYXRl
cywgdHJ1ZSk7Cj4+ICsgICAgICAgciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwg
Jmxpc3QsIGZhbHNlLCAmZHVwbGljYXRlcywgZmFsc2UpOwo+PiAgICAgICAgICAgaWYgKHIpIHsK
Pj4gICAgICAgICAgICAgICAgICAgZGV2X2VycihhZGV2LT5kZXYsICJsZWFraW5nIGJvIHZhIGJl
Y2F1c2UgIgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICJ3ZSBmYWlsIHRvIHJlc2VydmUg
Ym8gKCVkKVxuIiwgcik7Cj4+IEBAIC02MDgsNyArNjA4LDcgQEAgaW50IGFtZGdwdV9nZW1fdmFf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPj4KPj4gICAgICAgICAg
IGFtZGdwdV92bV9nZXRfcGRfYm8oJmZwcml2LT52bSwgJmxpc3QsICZ2bV9wZCk7Cj4+Cj4+IC0g
ICAgICAgciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIHRydWUsICZk
dXBsaWNhdGVzLCB0cnVlKTsKPj4gKyAgICAgICByID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygm
dGlja2V0LCAmbGlzdCwgdHJ1ZSwgJmR1cGxpY2F0ZXMsIGZhbHNlKTsKPj4gICAgICAgICAgIGlm
IChyKQo+PiAgICAgICAgICAgICAgICAgICBnb3RvIGVycm9yX3VucmVmOwo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCj4+IGluZGV4IGM0MzBlODI1OTAz
OC4uZDYwNTkzY2M0MzZlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfb2JqZWN0LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X29iamVjdC5oCj4+IEBAIC0xNTUsNyArMTU1LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1k
Z3B1X2JvX3Jlc2VydmUoc3RydWN0IGFtZGdwdV9ibyAqYm8sIGJvb2wgbm9faW50cikKPj4gICAg
ICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50
Ym8uYmRldik7Cj4+ICAgICAgICAgICBpbnQgcjsKPj4KPj4gLSAgICAgICByID0gdHRtX2JvX3Jl
c2VydmUoJmJvLT50Ym8sICFub19pbnRyLCBmYWxzZSwgTlVMTCk7Cj4+ICsgICAgICAgciA9IF9f
dHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sICFub19pbnRyLCBmYWxzZSwgTlVMTCk7Cj4+ICAgICAg
ICAgICBpZiAodW5saWtlbHkociAhPSAwKSkgewo+PiAgICAgICAgICAgICAgICAgICBpZiAociAh
PSAtRVJFU1RBUlRTWVMpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihhZGV2
LT5kZXYsICIlcCByZXNlcnZlIGZhaWxlZFxuIiwgYm8pOwo+PiAtLQo+PiAyLjE3LjEKPj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QKPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

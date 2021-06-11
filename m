Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD83A3FE2
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Jun 2021 12:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0628E6EE6A;
	Fri, 11 Jun 2021 10:12:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78676EE6A;
 Fri, 11 Jun 2021 10:12:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a11so5434021wrt.13;
 Fri, 11 Jun 2021 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=14tIyRA09sDfZvE6Mz/w7rsWpwH5X1sErxnjb1/BG/4=;
 b=EmGJYdhiYjGUvCIqWbpndOwsRzMlf3s3Mg2hqzUr2yd0jZFajBZ2YpKhjgpU6n45yk
 i8Sih/UVrLrRMQzmaTNevoOxOx7W+vKPm9F/+kbEL5RIMvFG+y2Mf09ttOt1UID/Tfly
 oGynmrVN4OiFusYi0sGK6Y6cwyk8cUpJJTySM79tdiBQa9UNebhVlNpe7v9yzgXWVCWO
 yL7B2bW6GNdbsk3s0If33FuHoYHb2g3Srq5iXKUMFIJDlGp4bEppuqjPQgpAOkke9cIp
 50SS6DonOg22fXyh5haJ15D5f1EDipswlCvsBH32opx+FgmQoVrlGIYlTNAkblRsgB52
 UcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=14tIyRA09sDfZvE6Mz/w7rsWpwH5X1sErxnjb1/BG/4=;
 b=NWFCgeuSPyx4WV7zevFpRxPs3pfd58pScI3sB24/yBi1I7BUotdYz7PpTGQHyORjN+
 JtcZkcl9YA7iIXP1ahv1EuBpoNZJHj58GFMGnvXjmY2W27Xdq5a2DebZQ+KRB60NfBz4
 WmhP44NKHi4TemkwE/ZCaVWjKi0aZ2cj3Kiou3//nrs6g72F8FUMhQBVmeBGjw5AApRz
 wmdSF21C0Zb1hwWjOeJpaTZhccBCGTgwfEdq2v3AuNgKQ9zkB6r54kjjEEm86H8HpNOp
 VLlgEgLuLvQA/LvM1K50cdpRZ4QxiIOxx9WKA5E02McpsJMFF9cj5hbRlOEeiMgydw5R
 /5TA==
X-Gm-Message-State: AOAM532QowQTyQ/Id9tMuJp3FxxnM0vQ4IAng5wgSBvX755CT6pTTOhR
 Elnue7QdGwE4+IMpU2qNBT8VXof41XQ=
X-Google-Smtp-Source: ABdhPJxvfa2YCyEB08ADyWKocMSMoy0rOek+/Ihcy8L3uYXLNaR5I+P69mINJzhB7bQYp+O4t0RPOg==
X-Received: by 2002:a5d:6111:: with SMTP id v17mr3178180wrt.20.1623406367331; 
 Fri, 11 Jun 2021 03:12:47 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:108e:ba37:cb49:9c3?
 ([2a02:908:1252:fb60:108e:ba37:cb49:9c3])
 by smtp.gmail.com with ESMTPSA id l10sm6235001wrs.11.2021.06.11.03.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 03:12:46 -0700 (PDT)
Subject: Re: [PATCH 7/7] drm/amdgpu: rework dma_resv handling
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-8-christian.koenig@amd.com>
 <YMMqI2jRReeK067f@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3a1eef23-7a9a-9a08-cb41-ce042d0bd36c@gmail.com>
Date: Fri, 11 Jun 2021 12:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMMqI2jRReeK067f@phenom.ffwll.local>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTEuMDYuMjEgdW0gMTE6MTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgSnVu
IDEwLCAyMDIxIGF0IDExOjE4OjAwQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IERyb3AgdGhlIHdvcmthcm91bmQgYW5kIGluc3RlYWQgaW1wbGVtZW50IGEgYmV0dGVyIHNvbHV0
aW9uLgo+Pgo+PiBCYXNpY2FsbHkgd2UgYXJlIG5vdyBjaGFpbmluZyBhbGwgc3VibWlzc2lvbnMg
dXNpbmcgYSBkbWFfZmVuY2VfY2hhaW4KPj4gY29udGFpbmVyIGFuZCBhZGRpbmcgdGhlbSBhcyBl
eGNsdXNpdmUgZmVuY2UgdG8gdGhlIGRtYV9yZXN2IG9iamVjdC4KPj4KPj4gVGhpcyB3YXkgb3Ro
ZXIgZHJpdmVycyBjYW4gc3RpbGwgc3luYyB0byB0aGUgc2luZ2xlIGV4Y2x1c2l2ZSBmZW5jZQo+
PiB3aGlsZSBhbWRncHUgb25seSBzeW5jIHRvIGZlbmNlcyBmcm9tIGRpZmZlcmVudCBwcm9jZXNz
ZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2JvX2xpc3QuaCB8ICAxICsKPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYyAgICAgIHwgNTQgKysrKysrKysrKysrKy0tLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgNjUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgICB8ICAzICstCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jICB8ICAyICstCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oICB8ICAxIC0KPj4gICA2
IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDc5IGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmgKPj4gaW5kZXggYTEz
MGU3NjZjYmRiLi5jOTA1YTRjZmMxNzMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2JvX2xpc3QuaAo+PiBAQCAtMzQsNiArMzQsNyBAQCBzdHJ1Y3QgYW1kZ3B1
X2Zwcml2Owo+PiAgIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeSB7Cj4+ICAgCXN0cnVjdCB0
dG1fdmFsaWRhdGVfYnVmZmVyCXR2Owo+PiAgIAlzdHJ1Y3QgYW1kZ3B1X2JvX3ZhCQkqYm9fdmE7
Cj4+ICsJc3RydWN0IGRtYV9mZW5jZV9jaGFpbgkJKmNoYWluOwo+PiAgIAl1aW50MzJfdAkJCXBy
aW9yaXR5Owo+PiAgIAlzdHJ1Y3QgcGFnZQkJCSoqdXNlcl9wYWdlczsKPj4gICAJYm9vbAkJCQl1
c2VyX2ludmFsaWRhdGVkOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+
PiBpbmRleCAzMjVlODI2MjE0NjcuLmY2ZjMwMjlmOTU4ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKPj4gQEAgLTU4Nyw2ICs1ODcsMjAgQEAgc3RhdGljIGlu
dCBhbWRncHVfY3NfcGFyc2VyX2JvcyhzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwKPj4gICAJ
CWdvdG8gb3V0Owo+PiAgIAl9Cj4+ICAgCj4+ICsJYW1kZ3B1X2JvX2xpc3RfZm9yX2VhY2hfZW50
cnkoZSwgcC0+Ym9fbGlzdCkgewo+PiArCQlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IHR0bV90b19h
bWRncHVfYm8oZS0+dHYuYm8pOwo+PiArCj4+ICsJCWUtPmJvX3ZhID0gYW1kZ3B1X3ZtX2JvX2Zp
bmQodm0sIGJvKTsKPj4gKwo+PiArCQlpZiAoYm8tPnRiby5iYXNlLmRtYV9idWYgJiYgIWFtZGdw
dV9ib19leHBsaWNpdF9zeW5jKGJvKSkgewo+PiArCQkJZS0+Y2hhaW4gPSBkbWFfZmVuY2VfY2hh
aW5fYWxsb2MoKTsKPj4gKwkJCWlmICghZS0+Y2hhaW4pIHsKPj4gKwkJCQlyID0gLUVOT01FTTsK
Pj4gKwkJCQlnb3RvIGVycm9yX3ZhbGlkYXRlOwo+PiArCQkJfQo+PiArCQl9Cj4+ICsJfQo+PiAr
Cj4+ICAgCWFtZGdwdV9jc19nZXRfdGhyZXNob2xkX2Zvcl9tb3ZlcyhwLT5hZGV2LCAmcC0+Ynl0
ZXNfbW92ZWRfdGhyZXNob2xkLAo+PiAgIAkJCQkJICAmcC0+Ynl0ZXNfbW92ZWRfdmlzX3RocmVz
aG9sZCk7Cj4+ICAgCXAtPmJ5dGVzX21vdmVkID0gMDsKPj4gQEAgLTYxNCwxNSArNjI4LDYgQEAg
c3RhdGljIGludCBhbWRncHVfY3NfcGFyc2VyX2JvcyhzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAq
cCwKPj4gICAJZ3dzID0gcC0+Ym9fbGlzdC0+Z3dzX29iajsKPj4gICAJb2EgPSBwLT5ib19saXN0
LT5vYV9vYmo7Cj4+ICAgCj4+IC0JYW1kZ3B1X2JvX2xpc3RfZm9yX2VhY2hfZW50cnkoZSwgcC0+
Ym9fbGlzdCkgewo+PiAtCQlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IHR0bV90b19hbWRncHVfYm8o
ZS0+dHYuYm8pOwo+PiAtCj4+IC0JCS8qIE1ha2Ugc3VyZSB3ZSB1c2UgdGhlIGV4Y2x1c2l2ZSBz
bG90IGZvciBzaGFyZWQgQk9zICovCj4+IC0JCWlmIChiby0+cHJpbWVfc2hhcmVkX2NvdW50KQo+
PiAtCQkJZS0+dHYubnVtX3NoYXJlZCA9IDA7Cj4+IC0JCWUtPmJvX3ZhID0gYW1kZ3B1X3ZtX2Jv
X2ZpbmQodm0sIGJvKTsKPj4gLQl9Cj4+IC0KPj4gICAJaWYgKGdkcykgewo+PiAgIAkJcC0+am9i
LT5nZHNfYmFzZSA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0KGdkcykgPj4gUEFHRV9TSElGVDsKPj4g
ICAJCXAtPmpvYi0+Z2RzX3NpemUgPSBhbWRncHVfYm9fc2l6ZShnZHMpID4+IFBBR0VfU0hJRlQ7
Cj4+IEBAIC02NDQsOCArNjQ5LDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNlcl9ib3Mo
c3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCj4+ICAgCX0KPj4gICAKPj4gICBlcnJvcl92YWxp
ZGF0ZToKPj4gLQlpZiAocikKPj4gKwlpZiAocikgewo+PiArCQlhbWRncHVfYm9fbGlzdF9mb3Jf
ZWFjaF9lbnRyeShlLCBwLT5ib19saXN0KSB7Cj4+ICsJCQlkbWFfZmVuY2VfY2hhaW5fZnJlZShl
LT5jaGFpbik7Cj4+ICsJCQllLT5jaGFpbiA9IE5VTEw7Cj4+ICsJCX0KPj4gICAJCXR0bV9ldV9i
YWNrb2ZmX3Jlc2VydmF0aW9uKCZwLT50aWNrZXQsICZwLT52YWxpZGF0ZWQpOwo+PiArCX0KPj4g
ICBvdXQ6Cj4+ICAgCXJldHVybiByOwo+PiAgIH0KPj4gQEAgLTY4NSw5ICs2OTUsMTcgQEAgc3Rh
dGljIHZvaWQgYW1kZ3B1X2NzX3BhcnNlcl9maW5pKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpw
YXJzZXIsIGludCBlcnJvciwKPj4gICB7Cj4+ICAgCXVuc2lnbmVkIGk7Cj4+ICAgCj4+IC0JaWYg
KGVycm9yICYmIGJhY2tvZmYpCj4+ICsJaWYgKGVycm9yICYmIGJhY2tvZmYpIHsKPj4gKwkJc3Ry
dWN0IGFtZGdwdV9ib19saXN0X2VudHJ5ICplOwo+PiArCj4+ICsJCWFtZGdwdV9ib19saXN0X2Zv
cl9lYWNoX2VudHJ5KGUsIHBhcnNlci0+Ym9fbGlzdCkgewo+PiArCQkJZG1hX2ZlbmNlX2NoYWlu
X2ZyZWUoZS0+Y2hhaW4pOwo+PiArCQkJZS0+Y2hhaW4gPSBOVUxMOwo+PiArCQl9Cj4+ICsKPj4g
ICAJCXR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZwYXJzZXItPnRpY2tldCwKPj4gICAJCQkJ
CSAgICZwYXJzZXItPnZhbGlkYXRlZCk7Cj4+ICsJfQo+PiAgIAo+PiAgIAlmb3IgKGkgPSAwOyBp
IDwgcGFyc2VyLT5udW1fcG9zdF9kZXBzOyBpKyspIHsKPj4gICAJCWRybV9zeW5jb2JqX3B1dChw
YXJzZXItPnBvc3RfZGVwc1tpXS5zeW5jb2JqKTsKPj4gQEAgLTEyNjAsNiArMTI3OCwyMCBAQCBz
dGF0aWMgaW50IGFtZGdwdV9jc19zdWJtaXQoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCj4+
ICAgCj4+ICAgCWFtZGdwdV92bV9tb3ZlX3RvX2xydV90YWlsKHAtPmFkZXYsICZmcHJpdi0+dm0p
Owo+PiAgIAo+PiArCWFtZGdwdV9ib19saXN0X2Zvcl9lYWNoX2VudHJ5KGUsIHAtPmJvX2xpc3Qp
IHsKPj4gKwkJc3RydWN0IGRtYV9yZXN2ICpyZXN2ID0gZS0+dHYuYm8tPmJhc2UucmVzdjsKPj4g
KwkJc3RydWN0IGRtYV9mZW5jZV9jaGFpbiAqY2hhaW4gPSBlLT5jaGFpbjsKPj4gKwo+PiArCQlp
ZiAoIWNoYWluKQo+PiArCQkJY29udGludWU7Cj4+ICsKPj4gKwkJZG1hX2ZlbmNlX2NoYWluX2lu
aXQoY2hhaW4sIGRtYV9yZXN2X2V4Y2xfZmVuY2UocmVzdiksCj4+ICsJCQkJICAgICBkbWFfZmVu
Y2VfZ2V0KHAtPmZlbmNlKSwgMSk7Cj4+ICsKPj4gKwkJcmN1X2Fzc2lnbl9wb2ludGVyKHJlc3Yt
PmZlbmNlX2V4Y2wsICZjaGFpbi0+YmFzZSk7Cj4gU28gZm9yIHNhZmV0eSBzaW5jZSB0aGlzIGlz
IG5vdyBkcml2ZXIgaW50ZXJmYWNlIEkgd2FzIHRoaW5raW5nIG9mZiBhCj4gaGVscGVyIHdoaWNo
IGRvZXMgdGhpcyBlbnRpcmUgZGFuY2UgYW5kIF9hbHNvXyBhZGRzIHRoZSBuZXcgZmVuY2UgdG8g
dGhlCj4gc2hhcmVkIHNsb3RzLiBUaGlzIHdheSB3ZSBkb24ndCBsZXQgZHJpdmVycyBvcGVuLWNv
ZGUgdGhpcyByYXRoZXIgdHJpY2t5Cj4gb3BlcmF0aW9uLgoKV2VsbCBJIG9ubHkgc2VlIHRoaXMg
YXMgYSB3b3JrYXJvdW5kIGZvciBhbWRncHUgYW5kIGRvbid0IHdhbnQgdG8gbGVhayAKaXQgaW50
byBvdGhlciBkcml2ZXJzLgoKSWYgc29tZWJvZHkgZWxzZSB3YW50cyB0byBhZG9wdCBpdCB3ZSBz
aG91bGQgcHJvYmFibHkgY29uc2lkZXIgZml4aW5nIAp0aGUgZG1hX3Jlc3Ygb2JqZWN0IGluc3Rl
YWQuCgo+IFlvdSBwcm9iYWJseSBhbHNvIHdhbnQgdG8gdGhlbiBjb21iaW5lIHRoaXMgd2l0aAo+
IHR0bV9ldV9mZW5jZV9idWZmZXJfb2JqZWN0cyBiZWxvdyBJIHRoaW5rIHNvIHlvdSdyZSBub3Qg
d2Fsa2luZyB0aGlzIGxpc3QKPiAyeC4KPgo+IElvdyBJJ2QgcHV0IHRoZSBmZW5jZV9jaGFpbiBw
YXJhbWV0ZXIgaW50byBzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciBhbmQKPiB0aGVuIGxldCB0
dG1fZXVfZmVuY2VfYnVmZmVyX29iamVjdHMoKSBkbyB0aGlzLCBieSBjYWxsaW5nIGEgbmV3Cj4g
ZG1hX3Jlc3ZfYWRkX3NoYXJlZF9leGNsX2ZlbmNlLiBJZGVhbGx5IHRoZSBzYW1lIGhlbHBlciB0
aGF0IGFsc28gSmFzb24ncwo+IHN5bmNfZmlsZSBpbXBvcnQgd2lsbCB1c2UuIFdlIHdhbnQgdG8g
aGlkZSB0aGUgaW5uZXIgd29ya2luZ3Mgb2YgZG1hX3Jlc3YKPiBhcyBtdWNoIGFzIHBvc3NpYmxl
IG9mYy4KPgo+IFRoZSBvdGhlciB0aGluZyBJJ20gd29uZGVyaW5nIGlzIHdoZXRoZXIgdGhpcyBu
ZWVkcyB0byBiZSB3cmFwcGVkIGluIGEKPiBzaW5nbGUgc2VxbG9jayBvciB3aGV0aGVyIHdlIGRv
bid0IGhhdmUgb3JkZXJpbmcgaXNzdWVzIGlmIHdlIHNwbGl0IHVwIHRoZQo+IHVwZGF0ZSBoZXJl
PyBTZXR0aW5nIHRoZSBleGNsdXNpdmUgZmVuY2UgYmVmb3JlIHdlIGFsc28gYWRkZWQgaXQgdG8g
dGhlCj4gc2hhcmVkIHNsb3QgY2FuIGF0IGxlYXN0IHZpb2xhdGUgdGhlICJzaGFyZWQgZmVuY2Vz
IHNpZ25hbCBhZnRlciBleGNsdXNpdmUKPiBpZiBib3RoIGFyZSBwcmVzZW50IgoKVWZmLCBnb29k
IHBvaW50LgoKPiBGaW5hbGx5IEkgZ3Vlc3MgbmVlZCB0byBzcHJpbmtsZSB0aGUgbWFudWFsIGdh
cmJhZ2UgY29sbGVjdG9yIHNvbWVod2VyZQo+IGhlcmUgdG9vLgoKVGhhdCBpcyBkb25lIGF1dG9t
YXRpY2FsbHkgd2hlbiBzb21lYm9keSBpdGVyYXRlcyB0aGUgY2hhaW4gbm9kZS4KCkNocmlzdGlh
bi4KCj4KPiBCdXQgYXNpZGUgZnJvbSB0aGUgaW50ZXJmYWNlIHBvbGlzaCBhbmQgY29ycmVjdG5l
c3MgYWdhaW5zdCByYWNlcyBJIHRoaW5rCj4gdGhpcyBsb29rcyBzb2xpZCBpbiB0aGUgYmlnIHBp
Y3R1cmUuCj4KPiBDaGVlcnMsIERhbmllbAo+Cj4+ICsJCWUtPmNoYWluID0gTlVMTDsKPj4gKwl9
Cj4+ICsKPj4gICAJdHRtX2V1X2ZlbmNlX2J1ZmZlcl9vYmplY3RzKCZwLT50aWNrZXQsICZwLT52
YWxpZGF0ZWQsIHAtPmZlbmNlKTsKPj4gICAJbXV0ZXhfdW5sb2NrKCZwLT5hZGV2LT5ub3RpZmll
cl9sb2NrKTsKPj4gICAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kbWFfYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1h
X2J1Zi5jCj4+IGluZGV4IGMzMDUzYjgzYjgwYy4uMjMyMTlmYzNiMjhjIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPj4gQEAgLTQyLDQ4ICs0
Miw2IEBACj4+ICAgI2luY2x1ZGUgPGxpbnV4L3BjaS1wMnBkbWEuaD4KPj4gICAjaW5jbHVkZSA8
bGludXgvcG1fcnVudGltZS5oPgo+PiAgIAo+PiAtc3RhdGljIGludAo+PiAtX19kbWFfcmVzdl9t
YWtlX2V4Y2x1c2l2ZShzdHJ1Y3QgZG1hX3Jlc3YgKm9iaikKPj4gLXsKPj4gLQlzdHJ1Y3QgZG1h
X2ZlbmNlICoqZmVuY2VzOwo+PiAtCXVuc2lnbmVkIGludCBjb3VudDsKPj4gLQlpbnQgcjsKPj4g
LQo+PiAtCWlmICghZG1hX3Jlc3Zfc2hhcmVkX2xpc3Qob2JqKSkgLyogbm8gc2hhcmVkIGZlbmNl
cyB0byBjb252ZXJ0ICovCj4+IC0JCXJldHVybiAwOwo+PiAtCj4+IC0JciA9IGRtYV9yZXN2X2dl
dF9mZW5jZXMob2JqLCBOVUxMLCAmY291bnQsICZmZW5jZXMpOwo+PiAtCWlmIChyKQo+PiAtCQly
ZXR1cm4gcjsKPj4gLQo+PiAtCWlmIChjb3VudCA9PSAwKSB7Cj4+IC0JCS8qIE5vdyB0aGF0IHdh
cyB1bmV4cGVjdGVkLiAqLwo+PiAtCX0gZWxzZSBpZiAoY291bnQgPT0gMSkgewo+PiAtCQlkbWFf
cmVzdl9hZGRfZXhjbF9mZW5jZShvYmosIGZlbmNlc1swXSk7Cj4+IC0JCWRtYV9mZW5jZV9wdXQo
ZmVuY2VzWzBdKTsKPj4gLQkJa2ZyZWUoZmVuY2VzKTsKPj4gLQl9IGVsc2Ugewo+PiAtCQlzdHJ1
Y3QgZG1hX2ZlbmNlX2FycmF5ICphcnJheTsKPj4gLQo+PiAtCQlhcnJheSA9IGRtYV9mZW5jZV9h
cnJheV9jcmVhdGUoY291bnQsIGZlbmNlcywKPj4gLQkJCQkJICAgICAgIGRtYV9mZW5jZV9jb250
ZXh0X2FsbG9jKDEpLCAwLAo+PiAtCQkJCQkgICAgICAgZmFsc2UpOwo+PiAtCQlpZiAoIWFycmF5
KQo+PiAtCQkJZ290byBlcnJfZmVuY2VzX3B1dDsKPj4gLQo+PiAtCQlkbWFfcmVzdl9hZGRfZXhj
bF9mZW5jZShvYmosICZhcnJheS0+YmFzZSk7Cj4+IC0JCWRtYV9mZW5jZV9wdXQoJmFycmF5LT5i
YXNlKTsKPj4gLQl9Cj4+IC0KPj4gLQlyZXR1cm4gMDsKPj4gLQo+PiAtZXJyX2ZlbmNlc19wdXQ6
Cj4+IC0Jd2hpbGUgKGNvdW50LS0pCj4+IC0JCWRtYV9mZW5jZV9wdXQoZmVuY2VzW2NvdW50XSk7
Cj4+IC0Ja2ZyZWUoZmVuY2VzKTsKPj4gLQlyZXR1cm4gLUVOT01FTTsKPj4gLX0KPj4gLQo+PiAg
IC8qKgo+PiAgICAqIGFtZGdwdV9kbWFfYnVmX2F0dGFjaCAtICZkbWFfYnVmX29wcy5hdHRhY2gg
aW1wbGVtZW50YXRpb24KPj4gICAgKgo+PiBAQCAtMTEwLDI0ICs2OCw2IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2RtYV9idWZfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCj4+ICAgCWlmIChy
IDwgMCkKPj4gICAJCWdvdG8gb3V0Owo+PiAgIAo+PiAtCXIgPSBhbWRncHVfYm9fcmVzZXJ2ZShi
bywgZmFsc2UpOwo+PiAtCWlmICh1bmxpa2VseShyICE9IDApKQo+PiAtCQlnb3RvIG91dDsKPj4g
LQo+PiAtCS8qCj4+IC0JICogV2Ugb25seSBjcmVhdGUgc2hhcmVkIGZlbmNlcyBmb3IgaW50ZXJu
YWwgdXNlLCBidXQgaW1wb3J0ZXJzCj4+IC0JICogb2YgdGhlIGRtYWJ1ZiByZWx5IG9uIGV4Y2x1
c2l2ZSBmZW5jZXMgZm9yIGltcGxpY2l0bHkKPj4gLQkgKiB0cmFja2luZyB3cml0ZSBoYXphcmRz
LiBBcyBhbnkgb2YgdGhlIGN1cnJlbnQgZmVuY2VzIG1heQo+PiAtCSAqIGNvcnJlc3BvbmQgdG8g
YSB3cml0ZSwgd2UgbmVlZCB0byBjb252ZXJ0IGFsbCBleGlzdGluZwo+PiAtCSAqIGZlbmNlcyBv
biB0aGUgcmVzZXJ2YXRpb24gb2JqZWN0IGludG8gYSBzaW5nbGUgZXhjbHVzaXZlCj4+IC0JICog
ZmVuY2UuCj4+IC0JICovCj4+IC0JciA9IF9fZG1hX3Jlc3ZfbWFrZV9leGNsdXNpdmUoYm8tPnRi
by5iYXNlLnJlc3YpOwo+PiAtCWlmIChyKQo+PiAtCQlnb3RvIG91dDsKPj4gLQo+PiAtCWJvLT5w
cmltZV9zaGFyZWRfY291bnQrKzsKPj4gLQlhbWRncHVfYm9fdW5yZXNlcnZlKGJvKTsKPj4gICAJ
cmV0dXJuIDA7Cj4+ICAgCj4+ICAgb3V0Ogo+PiBAQCAtMTUwLDkgKzkwLDYgQEAgc3RhdGljIHZv
aWQgYW1kZ3B1X2RtYV9idWZfZGV0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCj4+ICAgCXN0
cnVjdCBhbWRncHVfYm8gKmJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmopOwo+PiAgIAlzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwo+PiAg
IAo+PiAtCWlmIChhdHRhY2gtPmRldi0+ZHJpdmVyICE9IGFkZXYtPmRldi0+ZHJpdmVyICYmIGJv
LT5wcmltZV9zaGFyZWRfY291bnQpCj4+IC0JCWJvLT5wcmltZV9zaGFyZWRfY291bnQtLTsKPj4g
LQo+PiAgIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGFkZXZfdG9fZHJtKGFkZXYpLT5kZXYp
Owo+PiAgIAlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChhZGV2X3RvX2RybShhZGV2KS0+ZGV2
KTsKPj4gICB9Cj4+IEBAIC00MDYsOCArMzQzLDYgQEAgYW1kZ3B1X2RtYV9idWZfY3JlYXRlX29i
aihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikKPj4gICAJ
Ym8gPSBnZW1fdG9fYW1kZ3B1X2JvKGdvYmopOwo+PiAgIAliby0+YWxsb3dlZF9kb21haW5zID0g
QU1ER1BVX0dFTV9ET01BSU5fR1RUOwo+PiAgIAliby0+cHJlZmVycmVkX2RvbWFpbnMgPSBBTURH
UFVfR0VNX0RPTUFJTl9HVFQ7Cj4+IC0JaWYgKGRtYV9idWYtPm9wcyAhPSAmYW1kZ3B1X2RtYWJ1
Zl9vcHMpCj4+IC0JCWJvLT5wcmltZV9zaGFyZWRfY291bnQgPSAxOwo+PiAgIAo+PiAgIAlkbWFf
cmVzdl91bmxvY2socmVzdik7Cj4+ICAgCXJldHVybiBnb2JqOwo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4+IGluZGV4IDFjM2UzYjYwODMzMi4uNWQ4MjEyMGZjMTYw
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4+IEBAIC04
MjksNyArODI5LDggQEAgaW50IGFtZGdwdV9nZW1fb3BfaW9jdGwoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSwKPj4gICAJCWJyZWFrOwo+PiAgIAl9Cj4+ICAgCWNhc2UgQU1ER1BV
X0dFTV9PUF9TRVRfUExBQ0VNRU5UOgo+PiAtCQlpZiAocm9iai0+cHJpbWVfc2hhcmVkX2NvdW50
ICYmIChhcmdzLT52YWx1ZSAmIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pKSB7Cj4+ICsJCWlmIChy
b2JqLT50Ym8uYmFzZS5pbXBvcnRfYXR0YWNoICYmCj4+ICsJCSAgICBhcmdzLT52YWx1ZSAmIEFN
REdQVV9HRU1fRE9NQUlOX1ZSQU0pIHsKPj4gICAJCQlyID0gLUVJTlZBTDsKPj4gICAJCQlhbWRn
cHVfYm9fdW5yZXNlcnZlKHJvYmopOwo+PiAgIAkJCWJyZWFrOwo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+IGluZGV4IDk2NDQ3ZTFkNGM5Yy4uMzA5NTFi
NTkzODA5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVj
dC5jCj4+IEBAIC04NzEsNyArODcxLDcgQEAgaW50IGFtZGdwdV9ib19waW5fcmVzdHJpY3RlZChz
dHJ1Y3QgYW1kZ3B1X2JvICpibywgdTMyIGRvbWFpbiwKPj4gICAJCXJldHVybiAtRUlOVkFMOwo+
PiAgIAo+PiAgIAkvKiBBIHNoYXJlZCBibyBjYW5ub3QgYmUgbWlncmF0ZWQgdG8gVlJBTSAqLwo+
PiAtCWlmIChiby0+cHJpbWVfc2hhcmVkX2NvdW50IHx8IGJvLT50Ym8uYmFzZS5pbXBvcnRfYXR0
YWNoKSB7Cj4+ICsJaWYgKGJvLT50Ym8uYmFzZS5pbXBvcnRfYXR0YWNoKSB7Cj4+ICAgCQlpZiAo
ZG9tYWluICYgQU1ER1BVX0dFTV9ET01BSU5fR1RUKQo+PiAgIAkJCWRvbWFpbiA9IEFNREdQVV9H
RU1fRE9NQUlOX0dUVDsKPj4gICAJCWVsc2UKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuaAo+PiBpbmRleCBiMzU5NjI3MDIyNzguLjU1ZDdlOTBlYWE3MiAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaAo+PiBAQCAt
OTgsNyArOTgsNiBAQCBzdHJ1Y3QgYW1kZ3B1X2JvIHsKPj4gICAJc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0CXRibzsKPj4gICAJc3RydWN0IHR0bV9ib19rbWFwX29iagkJa21hcDsKPj4gICAJdTY0
CQkJCWZsYWdzOwo+PiAtCXVuc2lnbmVkCQkJcHJpbWVfc2hhcmVkX2NvdW50Owo+PiAgIAkvKiBw
ZXIgVk0gc3RydWN0dXJlIGZvciBwYWdlIHRhYmxlcyBhbmQgd2l0aCB2aXJ0dWFsIGFkZHJlc3Nl
cyAqLwo+PiAgIAlzdHJ1Y3QgYW1kZ3B1X3ZtX2JvX2Jhc2UJKnZtX2JvOwo+PiAgIAkvKiBDb25z
dGFudCBhZnRlciBpbml0aWFsaXphdGlvbiAqLwo+PiAtLSAKPj4gMi4yNS4xCj4+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK

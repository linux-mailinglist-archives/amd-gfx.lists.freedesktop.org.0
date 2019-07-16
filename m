Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4236A4EB
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 11:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A36489D4B;
	Tue, 16 Jul 2019 09:29:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BC989D4B
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 09:29:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n9so20185746wru.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 02:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=R4Pm3yr6mnA20mUWo2QMBbRbxNXnG5HUKc8T/Q7iB+k=;
 b=FGY48zc6gfyBFxLeVvJuWI4MElsaHOpQY8f5E+jQAsuXexYrD+IOkOrNpXQ+vl0at7
 XqLIAROTPmtn4dYTJaQhy0oKbQ8Zv5SN0jAIBucvTVpZgv+JFgB1XUeV3da8gcB+mF8h
 AyvXVdFT/NgRkNV+/ROwdGUraPXHea0lWneFgK14xpt5nC8zSJD3LViL7evJox5SMzSU
 H6cBXGX2JR/qWUe2oWqOfpVWyZfcb691ihFej3vx27vD1zNsuDNdeJ4oNq2D05vyRFWx
 CwhkaTNfv4LYjjTyHv7QvJAndxA+2fb/rJsem0kikhk4Xis5W90X4sGYe+hTxwPespoY
 WaQw==
X-Gm-Message-State: APjAAAUptEK7iE4dRHnw183FBy7toF2CKd8hiUD3QqPAJtlB3NJxWFGb
 7wdBFv5hBmKLGQU7JT/yvhpnI7/C
X-Google-Smtp-Source: APXvYqzHMqd2t/87oc6XLIaLkXCnSZSbL1fAqpYe8Uc1YF9NaXYJJHnLKPpOE3qakiuJcjtlslYpoQ==
X-Received: by 2002:a5d:5507:: with SMTP id b7mr34274115wrv.35.1563269361636; 
 Tue, 16 Jul 2019 02:29:21 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r15sm19744029wrj.68.2019.07.16.02.29.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 02:29:21 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: Fix silent amdgpu_bo_move failures
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190713064211.20047-1-Felix.Kuehling@amd.com>
 <20190713064211.20047-2-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <166533ad-2894-5a93-d5dc-09887c3067e3@gmail.com>
Date: Tue, 16 Jul 2019 11:29:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190713064211.20047-2-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=R4Pm3yr6mnA20mUWo2QMBbRbxNXnG5HUKc8T/Q7iB+k=;
 b=TgQOFpfvYHSlcy+HLJmsHzcri7SooswRlEITqWYsqabwsKyypfa3HXFnsibj3elvx5
 /yNryVsPlqZ/FAXpzOwdMagR4jpJ4oClZnAwPu8RTRtyXqJdyX9cbXYvBCZTKw3fJ9X+
 lvXRgQVns3OM5IYHv3kaoOlwntJ9bmvkiSFSq8X/PwG6ZSQN5SIBHCseH+KZc+C7JxF1
 ypJ4thwvFDnZEtCsI3TNxTt+JpOKAUpmj10GTG1R6nbaaSoRj4bNNAUlvzlcF2kWo7Nt
 KkjzgCdN+PqgJrytsgAw7qbJ8kZDV9V/uh+l80jWPvm3CYRnSK7u283ZEJYLbE5So5PO
 p05A==
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

QW0gMTMuMDcuMTkgdW0gMDg6NDIgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gVW5kZXIgbWVt
b3J5IHByZXNzdXJlLCBidWZmZXIgbW92ZXMgYmV0d2VlbiBSQU0gdG8gVlJBTSAgY2FuCj4gZmFp
bCB3aGVuIHRoZXJlIGlzIG5vIEdUVCBzcGFjZSBhdmFpbGFibGUuIEluIHRob3NlIGNhc2VzCj4g
YW1kZ3B1X2JvX21vdmUgZmFsbHMgYmFjayB0byB0dG1fYm9fbW92ZV9tZW1jcHksIHdoaWNoIHNl
ZW1zIHRvCj4gc3VjY2VlZCwgYWx0aG91Z2ggaXQgZG9lc24ndCByZWFsbHkgc3VwcG9ydCBub24t
Y29udGlndW91cyBvcgo+IGludmlzaWJsZSBWUkFNLiBUaGlzIG1hbmlmZXN0cyBhcyBWTSBmYXVs
dHMgd2l0aCBjb3JydXB0ZWQgcGFnZQo+IHRhYmxlIGVudHJpZXMgaW4gS0ZEIGV2aWN0aW9uIHN0
cmVzcyB0ZXN0cy4KPgo+IFByaW50IHNvbWUgaGVscGZ1bCBtZXNzYWdlcyB3aGVuIGxhY2sgb2Yg
R1RUIHNwYWNlIGlzIGNhdXNpbmcgYnVmZmVyCj4gbW92ZXMgdG8gZmFpbC4gQ2hlY2sgdGhhdCBz
b3VyY2UgYW5kIGRlc3RpbmF0aW9uIG1lbW9yeSByZWdpb25zIGFyZQo+IHN1cHBvcnRlZCBieSB0
dG1fYm9fbW92ZV9tZW1jcHkgYmVmb3JlIHRha2luZyB0aGF0IGZhbGxiYWNrLgo+Cj4gU2lnbmVk
LW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDQwICsrKysrKysr
KysrKysrKysrKysrKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+
IGluZGV4IDc4NDQwNzQ4Yzg3Zi4uMzdkOWEzYjA5OTQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IEBAIC00OTgsNiArNDk4LDcgQEAgc3RhdGljIGludCBh
bWRncHVfbW92ZV92cmFtX3JhbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2
aWN0LAo+ICAgCXBsYWNlbWVudHMuZmxhZ3MgPSBUVE1fUExfTUFTS19DQUNISU5HIHwgVFRNX1BM
X0ZMQUdfVFQ7Cj4gICAJciA9IHR0bV9ib19tZW1fc3BhY2UoYm8sICZwbGFjZW1lbnQsICZ0bXBf
bWVtLCBjdHgpOwo+ICAgCWlmICh1bmxpa2VseShyKSkgewo+ICsJCXByX2VycigiRmFpbGVkIHRv
IGZpbmQgR1RUIHNwYWNlIGZvciBibGl0IGZyb20gVlJBTVxuIik7Cj4gICAJCXJldHVybiByOwo+
ICAgCX0KPiAgIAo+IEBAIC01NTYsNiArNTU3LDcgQEAgc3RhdGljIGludCBhbWRncHVfbW92ZV9y
YW1fdnJhbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2aWN0LAo+ICAgCXBs
YWNlbWVudHMuZmxhZ3MgPSBUVE1fUExfTUFTS19DQUNISU5HIHwgVFRNX1BMX0ZMQUdfVFQ7Cj4g
ICAJciA9IHR0bV9ib19tZW1fc3BhY2UoYm8sICZwbGFjZW1lbnQsICZ0bXBfbWVtLCBjdHgpOwo+
ICAgCWlmICh1bmxpa2VseShyKSkgewo+ICsJCXByX2VycigiRmFpbGVkIHRvIGZpbmQgR1RUIHNw
YWNlIGZvciBibGl0IHRvIFZSQU1cbiIpOwo+ICAgCQlyZXR1cm4gcjsKPiAgIAl9Cj4gICAKPiBA
QCAtNTc1LDYgKzU3NywzMCBAQCBzdGF0aWMgaW50IGFtZGdwdV9tb3ZlX3JhbV92cmFtKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCj4gICAJcmV0dXJuIHI7Cj4gICB9
Cj4gICAKPiArLyoqCj4gKyAqIGFtZGdwdV9tZW1fdmlzaWJsZSAtIENoZWNrIHRoYXQgbWVtb3J5
IGNhbiBiZSBhY2Nlc3NlZCBieSB0dG1fYm9fbW92ZV9tZW1jcHkKPiArICoKPiArICogQ2FsbGVk
IGJ5IGFtZGdwdV9ib19tb3ZlKCkKPiArICovCj4gK3N0YXRpYyBib29sIGFtZGdwdV9tZW1fdmlz
aWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiArCQkJICAgICAgIHN0cnVjdCB0dG1f
bWVtX3JlZyAqbWVtKQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzID0gbWVtLT5t
bV9ub2RlOwo+ICsKPiArCWlmIChtZW0tPm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0gfHwKPiAr
CSAgICBtZW0tPm1lbV90eXBlID09IFRUTV9QTF9UVCkKPiArCQlyZXR1cm4gdHJ1ZTsKPiArCWlm
IChtZW0tPm1lbV90eXBlICE9IFRUTV9QTF9WUkFNKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCj4g
KwkvKiB0dG1fbWVtX3JlZ19pb3JlbWFwIG9ubHkgc3VwcG9ydHMgY29udGlndW91cyBtZW1vcnkg
Ki8KPiArCWlmIChub2Rlcy0+c2l6ZSAhPSBtZW0tPm51bV9wYWdlcykKPiArCQlyZXR1cm4gZmFs
c2U7Cj4gKwo+ICsJcmV0dXJuICgobm9kZXMtPnN0YXJ0ICsgbm9kZXMtPnNpemUpIDw8IFBBR0Vf
U0hJRlQpCj4gKwkJPD0gYWRldi0+Z21jLnZpc2libGVfdnJhbV9zaXplOwo+ICt9Cj4gKwo+ICAg
LyoqCj4gICAgKiBhbWRncHVfYm9fbW92ZSAtIE1vdmUgYSBidWZmZXIgb2JqZWN0IHRvIGEgbmV3
IG1lbW9yeSBsb2NhdGlvbgo+ICAgICoKPiBAQCAtNjE5LDggKzY0NSwxMCBAQCBzdGF0aWMgaW50
IGFtZGdwdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3Qs
Cj4gICAJCXJldHVybiAwOwo+ICAgCX0KPiAgIAo+IC0JaWYgKCFhZGV2LT5tbWFuLmJ1ZmZlcl9m
dW5jc19lbmFibGVkKQo+ICsJaWYgKCFhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jc19lbmFibGVkKSB7
Cj4gKwkJciA9IC1FTk9ERVY7Cj4gICAJCWdvdG8gbWVtY3B5Owo+ICsJfQo+ICAgCj4gICAJaWYg
KG9sZF9tZW0tPm1lbV90eXBlID09IFRUTV9QTF9WUkFNICYmCj4gICAJICAgIG5ld19tZW0tPm1l
bV90eXBlID09IFRUTV9QTF9TWVNURU0pIHsKPiBAQCAtNjM1LDEwICs2NjMsMTYgQEAgc3RhdGlj
IGludCBhbWRncHVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2
aWN0LAo+ICAgCj4gICAJaWYgKHIpIHsKPiAgIG1lbWNweToKPiAtCQlyID0gdHRtX2JvX21vdmVf
bWVtY3B5KGJvLCBjdHgsIG5ld19tZW0pOwo+IC0JCWlmIChyKSB7Cj4gKwkJLyogQ2hlY2sgdGhh
dCBhbGwgbWVtb3J5IGlzIENQVSBhY2Nlc3NpYmxlICovCj4gKwkJaWYgKCFhbWRncHVfbWVtX3Zp
c2libGUoYWRldiwgb2xkX21lbSkgfHwKPiArCQkgICAgIWFtZGdwdV9tZW1fdmlzaWJsZShhZGV2
LCBuZXdfbWVtKSkgewo+ICsJCQlwcl9lcnIoIk1vdmUgYnVmZmVyIGZhbGxiYWNrIHRvIG1lbWNw
eSB1bmF2YWlsYWJsZVxuIik7Cj4gICAJCQlyZXR1cm4gcjsKPiAgIAkJfQo+ICsKPiArCQlyID0g
dHRtX2JvX21vdmVfbWVtY3B5KGJvLCBjdHgsIG5ld19tZW0pOwo+ICsJCWlmIChyKQo+ICsJCQly
ZXR1cm4gcjsKPiAgIAl9Cj4gICAKPiAgIAlpZiAoYm8tPnR5cGUgPT0gdHRtX2JvX3R5cGVfZGV2
aWNlICYmCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017D1ADEE3
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Apr 2020 15:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48F86EC0B;
	Fri, 17 Apr 2020 13:59:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CC56EBFE;
 Fri, 17 Apr 2020 13:59:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k1so3182383wrx.4;
 Fri, 17 Apr 2020 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nlisnDxdgaFK9V5Dj7hV44s/k7j4LFrmWkeS7EKcVH4=;
 b=oTlzjn5Ubl4uDmSRbU3FNlxzwSOHUoZihX42C64UMjMeA6UmGMLSduRX2Njrfk0gQ8
 D7e3DDH0eGcrclA1jzGtQm1/4cSMB4Tc2YEqQJu+mL2tFgr1UGH39zK6aGvKLeDvM8pG
 Xk3RoqwzEVQLAltynnwp+6f4lM4fRkgbrkhQC+gA/+lo9QKvD+FlAv/X2YzsFuDNXUKn
 X8+yg2mJz9U1D1JKy5l93PX9ooSZuVqTgwEslE+silEkn8aEg5PkQLkGKmaiBrrM4elF
 4cltOgrlSgzxhBaXKqG5HQN/71J++ukpLMn3L86HnusRUKf/sYYZBaTz6/i57YuXt08e
 AW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nlisnDxdgaFK9V5Dj7hV44s/k7j4LFrmWkeS7EKcVH4=;
 b=BG466oW8P4CWaUbMldW/FVhawcJs6CvWxTgnP57BUo3Z4NQZjwj4IPhTQ5PI+iJ9g/
 COMwTe05Rxz0tGi8PMm501SqB4tH6zExngNWS7Wc371AXvmKTj5qOHN6LK26jDvgNiuI
 H2dn9YtZDvFC9jhZ/vJNZe46RDuHjaaI9uR7ZWrQwC+LPQJ/HkbGQcHMGWlXnCrTWwYL
 eOEUWEQYST9vIHyRdgI7VzFhL0FpzSHYlJxGq4lg5Nw+r9C69btDDU+rD6KiCy/ZNjRM
 iWcNDFi+c+ZVhAmIxeaBTzuWe8QplXzLsduLUZLGqAqLElPsF3cjnXzLL0fFqI6z1GM6
 w+SA==
X-Gm-Message-State: AGi0PuZwexZZ6hRtfrqUuIXEX5BqLsx+geFMPU0CaGEby2Cb5dxYjpX6
 UcZ8tXhr2WcSr0JAwAJSdoXPJe5t26NN+9M2Cg4=
X-Google-Smtp-Source: APiQypJ5RuwNjBBNOOuUN0lsUE85uoH+Wm9g7IHWfDHg4sB7twV0nxMFj7A+ytVL+34mZSl79flpnTeuNeTKWvMKWbc=
X-Received: by 2002:a5d:4106:: with SMTP id l6mr4013319wrp.111.1587131963996; 
 Fri, 17 Apr 2020 06:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200417101247.45616-1-yuehaibing@huawei.com>
In-Reply-To: <20200417101247.45616-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Apr 2020 09:59:12 -0400
Message-ID: <CADnq5_OCqKM3EYnjti0djh5hEPbRgO3qgJFeAU5tpqWc9PZiyA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/dc: remove unused variable
 'video_optimized_pixel_rates'
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: Chunming Zhou <David1.Zhou@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Wentland,
 Harry" <harry.wentland@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgOToxNiBBTSBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1
YXdlaS5jb20+IHdyb3RlOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9kYy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jOjEwMTc6NTA6Cj4gIHdhcm5pbmc6IOKAmHZpZGVv
X29wdGltaXplZF9waXhlbF9yYXRlc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
Y29uc3QtdmFyaWFibGU9XQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHBpeGVsX3JhdGVfcmFuZ2Vf
dGFibGVfZW50cnkgdmlkZW9fb3B0aW1pemVkX3BpeGVsX3JhdGVzW10gPSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KPgo+IGNvbW1pdCBkOGNkNTg3ZDJiZmQgKCJkcm0vYW1kL2Rpc3BsYXk6IHJl
bW92aW5nIE1PRFVMTyBjaGFuZ2UgZm9yIGRjbjIiKQo+IGxlZnQgYmVoaW5kIHRoaXMgdW51c2Vk
IHZhaXJhYmxlLCByZW1vdmUgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVo
YWliaW5nQGh1YXdlaS5jb20+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgLi4u
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jIHwgMzMgLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2Uu
Ywo+IGluZGV4IDJlOTkyZmJjMGQ3MS4uZDJhZDA1MDRiMGRlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNlLmMKPiBA
QCAtMTAxNCwzOSArMTAxNCw2IEBAIHN0cnVjdCBwaXhlbF9yYXRlX3JhbmdlX3RhYmxlX2VudHJ5
IHsKPiAgICAgICAgIHVuc2lnbmVkIHNob3J0IGRpdl9mYWN0b3I7Cj4gIH07Cj4KPiAtc3RhdGlj
IGNvbnN0IHN0cnVjdCBwaXhlbF9yYXRlX3JhbmdlX3RhYmxlX2VudHJ5IHZpZGVvX29wdGltaXpl
ZF9waXhlbF9yYXRlc1tdID0gewo+IC0gICAgICAgLy8gLzEuMDAxIHJhdGVzCj4gLSAgICAgICB7
MjUxNzAsIDI1MTgwLCAyNTIwMCwgMTAwMCwgMTAwMX0sICAgICAgLy8yNS4yTUh6ICAgLT4gICAy
NS4xNwo+IC0gICAgICAgezU5MzQwLCA1OTM1MCwgNTk0MDAsIDEwMDAsIDEwMDF9LCAgICAgIC8v
NTkuNE1oeiAgIC0+ICAgNTkuMzQwCj4gLSAgICAgICB7NzQxNzAsIDc0MTgwLCA3NDI1MCwgMTAw
MCwgMTAwMX0sICAgICAgLy83NC4yNU1oeiAgLT4gICA3NC4xNzU4Cj4gLSAgICAgICB7MTI1ODcw
LCAxMjU4ODAsIDEyNjAwMCwgMTAwMCwgMTAwMX0sICAgLy8xMjZNaHogICAgLT4gIDEyNS44Nwo+
IC0gICAgICAgezE0ODM1MCwgMTQ4MzYwLCAxNDg1MDAsIDEwMDAsIDEwMDF9LCAgIC8vMTQ4LjVN
aHogIC0+ICAxNDguMzUxNgo+IC0gICAgICAgezE2NzgzMCwgMTY3ODQwLCAxNjgwMDAsIDEwMDAs
IDEwMDF9LCAgIC8vMTY4TWh6ICAgIC0+ICAxNjcuODMKPiAtICAgICAgIHsyMjI1MjAsIDIyMjUz
MCwgMjIyNzUwLCAxMDAwLCAxMDAxfSwgICAvLzIyMi43NU1oeiAtPiAgMjIyLjUyNwo+IC0gICAg
ICAgezI1NzE0MCwgMjU3MTUwLCAyNTc0MDAsIDEwMDAsIDEwMDF9LCAgIC8vMjU3LjRNaHogIC0+
ICAyNTcuMTQyOQo+IC0gICAgICAgezI5NjcwMCwgMjk2NzEwLCAyOTcwMDAsIDEwMDAsIDEwMDF9
LCAgIC8vMjk3TWh6ICAgIC0+ICAyOTYuNzAzMwo+IC0gICAgICAgezM0Mjg1MCwgMzQyODYwLCAz
NDMyMDAsIDEwMDAsIDEwMDF9LCAgIC8vMzQzLjJNaHogIC0+ICAzNDIuODU3Cj4gLSAgICAgICB7
Mzk1NjAwLCAzOTU2MTAsIDM5NjAwMCwgMTAwMCwgMTAwMX0sICAgLy8zOTZNaHogICAgLT4gIDM5
NS42Cj4gLSAgICAgICB7NDA5MDkwLCA0MDkxMDAsIDQwOTUwMCwgMTAwMCwgMTAwMX0sICAgLy80
MDkuNU1oeiAgLT4gIDQwOS4wOTEKPiAtICAgICAgIHs0NDUwNTAsIDQ0NTA2MCwgNDQ1NTAwLCAx
MDAwLCAxMDAxfSwgICAvLzQ0NS41TWh6ICAtPiAgNDQ1LjA1NQo+IC0gICAgICAgezQ2NzUzMCwg
NDY3NTQwLCA0NjgwMDAsIDEwMDAsIDEwMDF9LCAgIC8vNDY4TWh6ICAgIC0+ICA0NjcuNTMyNQo+
IC0gICAgICAgezUxOTIzMCwgNTE5MjQwLCA1MTk3NTAsIDEwMDAsIDEwMDF9LCAgIC8vNTE5Ljc1
TWh6IC0+ICA1MTkuMjMxCj4gLSAgICAgICB7NTI1OTcwLCA1MjU5ODAsIDUyNjUwMCwgMTAwMCwg
MTAwMX0sICAgLy81MjYuNU1oeiAgLT4gIDUyNS45NzQKPiAtICAgICAgIHs1NDU0NTAsIDU0NTQ2
MCwgNTQ2MDAwLCAxMDAwLCAxMDAxfSwgICAvLzU0Nk1oeiAgICAtPiAgNTQ1LjQ1NQo+IC0gICAg
ICAgezU5MzQwMCwgNTkzNDEwLCA1OTQwMDAsIDEwMDAsIDEwMDF9LCAgIC8vNTk0TWh6ICAgIC0+
ICA1OTMuNDA2Ngo+IC0gICAgICAgezYyMzM3MCwgNjIzMzgwLCA2MjQwMDAsIDEwMDAsIDEwMDF9
LCAgIC8vNjI0TWh6ICAgIC0+ICA2MjMuMzc3Cj4gLSAgICAgICB7NjkyMzAwLCA2OTIzMTAsIDY5
MzAwMCwgMTAwMCwgMTAwMX0sICAgLy82OTNNaHogICAgLT4gIDY5Mi4zMDgKPiAtICAgICAgIHs3
MDEyOTAsIDcwMTMwMCwgNzAyMDAwLCAxMDAwLCAxMDAxfSwgICAvLzcwMk1oeiAgICAtPiAgNzAx
LjI5ODcKPiAtICAgICAgIHs3OTEyMDAsIDc5MTIxMCwgNzkyMDAwLCAxMDAwLCAxMDAxfSwgICAv
Lzc5Mk1oeiAgICAtPiAgNzkxLjIwOQo+IC0gICAgICAgezg5MDEwMCwgODkwMTEwLCA4OTEwMDAs
IDEwMDAsIDEwMDF9LCAgIC8vODkxTWh6ICAgIC0+ICA4OTAuMTA5OQo+IC0gICAgICAgezExODY4
MTAsIDExODY4MjAsIDExODgwMDAsIDEwMDAsIDEwMDF9LC8vMTE4OE1oeiAgIC0+IDExODYuODEz
MQo+IC0KPiAtICAgICAgIC8vICoxLjAwMSByYXRlcwo+IC0gICAgICAgezI3MDIwLCAyNzAzMCwg
MjcwMDAsIDEwMDEsIDEwMDB9LCAvLzI3TWh6Cj4gLSAgICAgICB7NTQwNTAsIDU0MDYwLCA1NDAw
MCwgMTAwMSwgMTAwMH0sIC8vNTRNaHoKPiAtICAgICAgIHsxMDgxMDAsIDEwODExMCwgMTA4MDAw
LCAxMDAxLCAxMDAwfSwvLzEwOE1oego+IC19Owo+IC0KPiAgc3RhdGljIGJvb2wgZGNuMjBfcHJv
Z3JhbV9waXhfY2xrKAo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgY2xvY2tfc291cmNlICpjbG9j
a19zb3VyY2UsCj4gICAgICAgICAgICAgICAgIHN0cnVjdCBwaXhlbF9jbGtfcGFyYW1zICpwaXhf
Y2xrX3BhcmFtcywKPiAtLQo+IDIuMTcuMQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cg==

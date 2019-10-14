Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0181D633B
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 15:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF2589D7F;
	Mon, 14 Oct 2019 13:01:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5922A89BF1
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 13:01:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b9so19671831wrs.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 06:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oxHewT73UCe8WL6IeDV84rZu8DbP5dGUy24aBc/dEg4=;
 b=Zrl9dju7S0fSmTw9w6J7q/HLUZjRByC+0MovztUnb9VOmM3Sl/WDLgnbZOCOqtR6HL
 fNxjLx5JW+Pd6jykw/DYQPuRrcYxKDXNN46WUXmpJflxzATsruidBhzx4zZWrOlGjC2W
 T1YEGwwthQ6mQXjDdmfP1xSn8e6L7kQNGGhMD9cd3Rq0l4TbBpU4WcvPQz5IDZuXuhga
 WLfndaZnskCOioAgq/MOiSDMCvFJhc6DXBZPXBjRCpB4AL3HOd6uGSLyU4zCEmKQ4T2p
 bhLJc8V5rf8WSC+QrBzu/V8GyAGPLUSO7aO3tqOgK93Pqbyw3bzS14klxI7A1Dq/2MKd
 4/IA==
X-Gm-Message-State: APjAAAVAnXXIpdnOTnGQ0IdNZTf9eN8pI13jbAswBLBB3ZE8UEB2zHkD
 20Rwvbh2WqQ0ir9KjR+Dd7jd9pKFJPCjEF7kacs=
X-Google-Smtp-Source: APXvYqwBvtrSDRKIOsNfotT+2koC/uiw1llLIghbexxIs83aY/wyFS0eJpP5U5rJ6zvldIqzMyQYG5PDqox+wULARh8=
X-Received: by 2002:adf:ba07:: with SMTP id o7mr26906305wrg.50.1571058109811; 
 Mon, 14 Oct 2019 06:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191011205050.21021-1-alexander.deucher@amd.com>
 <990fccc3-f8a1-a1dc-52c6-5299c645c24a@gmail.com>
In-Reply-To: <990fccc3-f8a1-a1dc-52c6-5299c645c24a@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Oct 2019 09:01:35 -0400
Message-ID: <CADnq5_O9ipAScOVXAvaqGTuM-4qMhzJdAK6_yxCg3-E3xzfqOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu/uvd6: fix allocation size in enc ring test
To: Christian Koenig <christian.koenig@amd.com>, Leo Liu <leo.liu@amd.com>, 
 James Zhu <James.Zhu@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oxHewT73UCe8WL6IeDV84rZu8DbP5dGUy24aBc/dEg4=;
 b=re3g43oTkxb79yLl8Rm5NYCPVpbSzQu0K2TJhXKm/L6qJvIpbTPkGMaLpQjUxnFOFM
 uJvckmfvaLaMWKfY96ox6z34KUIq8yCpTV0pPgeyXHGtePUTleHLUDKEKgtOIwCGFov4
 M7itIEzHmlqqvWlX4mePZIIS84Zw2LfbPcE668/ioaxvXUjuV3X812E/U8Ekm0xO34CI
 ClzvgfVO9XYKsa9HRjQdP/PeyYJPICMg4Q6dqbiQukcFxpI6fr7cuBjFW+fca9vTuWab
 dFFthJMbkct4/PyQM9ICVQN6G8DzXrACeSa/ng5hVkMLc4mROMKAFmRqz1pq0A9OkmF+
 Ws5A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgNTowNiBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAxMS4xMC4xOSB1bSAyMjo1
MCBzY2hyaWViIEFsZXggRGV1Y2hlcjoKPiA+IFdlIG5lZWQgdG8gYWxsb2NhdGUgYSBsYXJnZSBl
bm91Z2ggYnVmZmVyIGZvciB0aGUKPiA+IHNlc3Npb24gaW5mbywgb3RoZXJ3aXNlIHRoZSBJQiB0
ZXN0IGNhbiBvdmVyd3JpdGUKPiA+IG90aGVyIG1lbW9yeS4KPiA+Cj4gPiBCdWc6IGh0dHBzOi8v
YnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA0MjQxCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4KPiBBY2tlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBmb3IgdGhlIHNl
cmllcy4KCisgTGVvLCBKYW1lcwoKU2VlbXMgbGlrZSB3ZSBzdGlsbCBvdmVyd3JpdGUgdGhlIGJ1
ZmZlci4gIERvIHlvdSBrbm93IGhvdyBiaWcgdGhlCnNlc3Npb24gYnVmZmVyIG5lZWRzIHRvIGJl
PyAgSXMgaXQgZGlmZmVyZW50IGZvciBVVkQgYW5kIFZDTj8KCkFsZXgKCj4KPiA+IC0tLQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jIHwgOCArKysrLS0tLQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYwo+ID4gaW5kZXggNjcwNzg0YTc4NTEy
Li45MDliYzJjZTc5MWYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS91dmRfdjZfMC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZf
MC5jCj4gPiBAQCAtMjE1LDEyICsyMTUsMTIgQEAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfZ2V0
X2NyZWF0ZV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUKPiA+
ICAgICAgIHVpbnQ2NF90IGR1bW15Owo+ID4gICAgICAgaW50IGksIHI7Cj4gPgo+ID4gLSAgICAg
ciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9pYihyaW5nLT5hZGV2LCBpYl9zaXplX2R3ICogNCwg
JmpvYik7Cj4gPiArICAgICByID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYs
IChpYl9zaXplX2R3ICogNCkgKyAxMDI0LCAmam9iKTsKPiA+ICAgICAgIGlmIChyKQo+ID4gICAg
ICAgICAgICAgICByZXR1cm4gcjsKPiA+Cj4gPiAgICAgICBpYiA9ICZqb2ItPmlic1swXTsKPiA+
IC0gICAgIGR1bW15ID0gaWItPmdwdV9hZGRyICsgMTAyNDsKPiA+ICsgICAgIGR1bW15ID0gaWIt
PmdwdV9hZGRyICsgKGliX3NpemVfZHcgKiA0KTsKPiA+Cj4gPiAgICAgICBpYi0+bGVuZ3RoX2R3
ID0gMDsKPiA+ICAgICAgIGliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMDAwMTg7Cj4g
PiBAQCAtMjc3LDEyICsyNzcsMTIgQEAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfZ2V0X2Rlc3Ry
b3lfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKPiA+ICAgICAgIHVpbnQ2NF90IGR1bW15
Owo+ID4gICAgICAgaW50IGksIHI7Cj4gPgo+ID4gLSAgICAgciA9IGFtZGdwdV9qb2JfYWxsb2Nf
d2l0aF9pYihyaW5nLT5hZGV2LCBpYl9zaXplX2R3ICogNCwgJmpvYik7Cj4gPiArICAgICByID0g
YW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIChpYl9zaXplX2R3ICogNCkgKyAx
MDI0LCAmam9iKTsKPiA+ICAgICAgIGlmIChyKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gcjsK
PiA+Cj4gPiAgICAgICBpYiA9ICZqb2ItPmlic1swXTsKPiA+IC0gICAgIGR1bW15ID0gaWItPmdw
dV9hZGRyICsgMTAyNDsKPiA+ICsgICAgIGR1bW15ID0gaWItPmdwdV9hZGRyICsgKGliX3NpemVf
ZHcgKiA0KTsKPiA+Cj4gPiAgICAgICBpYi0+bGVuZ3RoX2R3ID0gMDsKPiA+ICAgICAgIGliLT5w
dHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMDAwMTg7Cj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4

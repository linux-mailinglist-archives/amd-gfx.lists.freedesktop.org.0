Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF3D1CF021
	for <lists+amd-gfx@lfdr.de>; Tue, 12 May 2020 11:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126816E8CF;
	Tue, 12 May 2020 09:00:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5402A6E8C6
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 May 2020 09:00:12 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e16so14354531wra.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 May 2020 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cSDqH5ij1BPhN02yjRk7X7Ch94EKjTTeY1hANr+YPIg=;
 b=LgQftZug1+s6r/6sfV0w6yEj/NMgDnXPjQ9rogWtkgMYDejoFBo0bPnwGW56hu1d7I
 qs3FiIgJnTmbmBqRQhBg/d/9mf6F8tXHWnk5q6Y4hrcpMMBBXw0ZHjxKx/PXQDwpH8gi
 /lG4giH5AqDaIZXE6JQNuQUTWIUktkeQZkN8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cSDqH5ij1BPhN02yjRk7X7Ch94EKjTTeY1hANr+YPIg=;
 b=nCkQvgaNYh1kXHsKAtXsa8qFxV3QIrssIQsD/0qoF5beHRiSPwlBTUZeU0Tmvkmng7
 DR1GekGQ1LdyVowv2gd4bpduHYYya7xIX4HQ0r2B4nXLGMez3/8cymeGD261g9BhS9Ly
 DGd+uzyEg+bCcs5C6gE16Rl2t7fJ/ZgL1ttkX2RMqTm6lTbfUgk91l3sq3+4UIwO5GDF
 +KAQr9pJTKn5OpDwjcqLKmhxo5aeagfqZJHcdG/SBRIIkpEGuF23Ujr+V/4WJvvQObn8
 vpO37pp3KRip0/X4mQ/5HlO0e759g6LvFzHrWC4cDH188v84igSmzkFJW+uKukIaG/9p
 Z2bw==
X-Gm-Message-State: AGi0PuYpLgvRD3lH5Zu5tck4dPZ04KZ6TEOsoFyxv4JMvz3dzBXqNjSc
 FhoPH31d7Eyi/P9aYE8nHF1uDA==
X-Google-Smtp-Source: APiQypIHDkKnk39vr0THs9MDd2lPRfxpCvBWLiPU8TBM9Ly4fBvHufkGUrgX+LdKysku7drbWjQ/Mg==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr25405016wrw.29.1589274010831; 
 Tue, 12 May 2020 02:00:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.02.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 02:00:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [RFC 13/17] drm/scheduler: use dma-fence annotations in tdr work
Date: Tue, 12 May 2020 10:59:40 +0200
Message-Id: <20200512085944.222637-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gdGhlIGZhY2Ugb2YgdW5wcml2aWxlZGdlZCB1c2Vyc3BhY2UgYmVpbmcgYWJsZSB0byBzdWJt
aXQgYm9ndXMgZ3B1Cndvcmtsb2FkcyB0aGUga2VybmVsIG5lZWRzIGdwdSB0aW1lb3V0IGFuZCBy
ZXNldCAodGRyKSB0byBndWFyYW50ZWUKdGhhdCBkbWFfZmVuY2VzIGFjdHVhbGx5IGNvbXBsZXRl
LiBBbm5vdGF0ZSB0aGlzIHdvcmtlciB0byBtYWtlIHN1cmUKd2UgZG9uJ3QgaGF2ZSBhbnkgYWNj
aWRlbnRhbCBsb2NraW5nIGludmVyc2lvbnMgb3Igb3RoZXIgcHJvYmxlbXMKbHVya2luZy4KCk9y
aWdpbmFsbHkgdGhpcyB3YXMgcGFydCBvZiB0aGUgb3ZlcmFsbCBzY2hlZHVsZXIgYW5ub3RhdGlv
biBwYXRjaC4KQnV0IGFtZGdwdSBoYXMgc29tZSBnbG9yaW91cyBpbnZlcnNpb25zIGhlcmU6Cgot
IGdyYWJzIGNvbnNvbGVfbG9jawotIGRvZXMgYSBmdWxsIG1vZGVzZXQsIHdoaWNoIGdyYWJzIGFs
bCBraW5kcyBvZiBsb2NrcwogIChkcm1fbW9kZXNldF9sb2NrLCBkbWFfcmVzdl9sb2NrKSB3aGlj
aCBjYW4gZGVhZGxvY2sgd2l0aAogIGRtYV9mZW5jZV93YWl0IGhlbGQgaW5zaWRlIHRoZW0uCi0g
YWxtb3N0IG1pbm9yIGF0IHRoYXQgcG9pbnQsIGJ1dCB0aGUgbW9kZXNldCBjb2RlIGFsc28gYWxs
b2NhdGVzCiAgbWVtb3J5CgpUaGVzZSBhbGwgbG9vayBsaWtlIHRoZXknbGwgYmUgdmVyeSBoYXJk
IHRvIGZpeCBwcm9wZXJseSwgdGhlIGhhcmR3YXJlCnNlZW1zIHRvIHJlcXVpcmUgYSBmdWxsIGRp
c3BsYXkgcmVzZXQgd2l0aCBhbnkgZ3B1IHJlY292ZXJ5LgoKSGVuY2Ugc3BsaXQgb3V0IGFzIGEg
c2VwZXJhdGUgcGF0Y2guCgpTaW5jZSBhbWRncHUgaXNuJ3QgdGhlIG9ubHkgaGFyZHdhcmUgZHJp
dmVyIHRoYXQgbmVlZHMgdG8gcmVzZXQgdGhlCmRpc3BsYXkgKGF0IGxlYXN0IGdlbjIvMyBvbiBp
bnRlbCBoYXZlIHRoZSBzYW1lIHByb2JsZW0pIHdlIG5lZWQgYQpnZW5lcmljIHNvbHV0aW9uIGZv
ciB0aGlzLiBUaGVyZSdzIHR3byB0cmlja3Mgd2UgY291bGQgc3RpbGwgZnJvbQpkcm0vaTkxNSBh
bmQgbGlmdCB0byBkbWEtZmVuY2U6CgotIFRoZSBiaWcgd2hhY2ssIGFrYSBmb3JjZS1jb21wbGV0
ZSBhbGwgZmVuY2VzLiBpOTE1IGRvZXMgdGhpcyBmb3IgYWxsCiAgcGVuZGluZyBqb2JzIGlmIHRo
ZSByZXNldCBpcyBzb21laG93IHN0dWNrLiBUcm91YmxlIGlzIHdlJ2QgbmVlZCB0bwogIGRvIHRo
aXMgZm9yIGFsbCBmZW5jZXMgaW4gdGhlIGVudGlyZSBzeXN0ZW0sIGFuZCBqdXN0IHRoZQogIGJv
b2sta2VlcGluZyBmb3IgdGhhdCB3aWxsIGJlIGZ1bi4gUGx1cyBsb3RzIG9mIGRyaXZlcnMgdXNl
IGZlbmNlcwogIGZvciBhbGwga2luZHMgb2YgaW50ZXJuYWwgc3R1ZmYgbGlrZSBtZW1vcnkgbWFu
YWdlbWVudCwgc28KICB1bmNvbmRpdGlvbmFsbHkgcmVzZXR0aW5nIGFsbCBvZiB0aGVtIGRvZXNu
J3Qgd29yay4KCiAgSSdtIGFsc28gaG9waW5nIHRoYXQgd2l0aCB0aGVzZSBmZW5jZSBhbm5vdGF0
aW9ucyB3ZSBjb3VsZCBlbmxpc3QKICBsb2NrZGVwIGluIGZpbmRpbmcgdGhlIGxhc3Qgb2ZmZW5k
ZXJzIGNhdXNpbmcgZGVhZGxvY2tzLCBhbmQgd2UKICBjb3VsZCByZW1vdmUgdGhpcyBnZXQtb3V0
LW9mLWphaWwgdHJpY2suCgotIFRoZSBtb3JlIGZlYXNpYmxlIGFwcHJvYWNoIChhY3Jvc3MgZHJp
dmVycyBhdCBsZWFzdCBhcyBwYXJ0IG9mIHRoZQogIGRtYV9mZW5jZSBjb250cmFjdCkgaXMgd2hh
dCBkcm0vaTkxNSBkb2VzIGZvciBnZW4yLzM6IFdoZW4gd2UgbmVlZAogIHRvIHJlc2V0IHRoZSBk
aXNwbGF5IHdlIHdha2UgdXAgYWxsIGRtYV9mZW5jZV93YWl0X2ludGVycnVwdGlibGUKICBjYWxs
cywgb3Igd2VsbCBhdCBsZWFzdCB0aGUgZXF1aXZhbGVudCBvZiB0aG9zZSBpbiBpOTE1IGludGVy
bmFsbHkuCgogIFJlbHlpbmcgb24gaW9jdGwgcmVzdGFydCB3ZSBmb3JjZSBhbGwgb3RoZXIgdGhy
ZWFkcyB0byByZWxlYXNlIHRoZWlyCiAgbG9ja3MsIHdoaWNoIG1lYW5zIHRoZSB0ZHIgdGhyZWFk
IGlzIGd1YXJhbnRlZWQgdG8gYmUgYWJsZSB0byBnZXQKICB0aGVtLiBJIHRoaW5rIHdlIGNvdWxk
IGltcGxlbWVudCB0aGlzIGF0IHRoZSBkbWFfZmVuY2UgbGV2ZWwsCiAgaW5jbHVkaW5nIHByb3Bl
ciBsb2NrZGVwIGFubm90YXRpb25zLgoKICBkbWFfZmVuY2VfYmVnaW5fdGRyKCk6CiAgLSBtdXN0
IGJlIG5lc3RlZCB3aXRoaW4gYSBkbWFfZmVuY2VfYmVnaW4vZW5kX3NpZ25hbGxpbmcgc2VjdGlv
bgogIC0gd2lsbCB3YWtlIHVwIGFsbCBpbnRlcnJ1cHRpYmxlIChidXQgbm90IHRoZSBub24taW50
ZXJydXB0aWJsZSkKICAgIGRtYV9mZW5jZV93YWl0KCkgY2FsbHMgYW5kIGZvcmNlIHRoZW0gdG8g
Y29tcGxldGUgd2l0aCBhCiAgICAtRVJFU1RBUlRTWVMgZXJybm8gY29kZS4gQWxsIG5ldyBpbnRl
cnJ1cGl0YmxlIGNhbGxzIHRvCiAgICBkbWFfZmVuY2Vfd2FpdCgpIHdpbGwgaW1tZWlkYXRlbHkg
ZmFpbCB3aXRoIHRoZSBzYW1lIGVycm9yIGNvZGUuCgogIGRtYV9mZW5jZV9lbmRfdHJkcigpOgog
IC0gdGhpcyB3aWxsIGNvbnZlcnQgZG1hX2ZlbmNlX3dhaXQoKSBjYWxscyBiYWNrIHRvIG5vcm1h
bC4KCiAgT2YgY291cnNlIGludGVycnVwdGluZyBkbWFfZmVuY2Vfd2FpdCBpcyBvbmx5IG9rIGlm
IHRoZSBjYWxsZXIKICBzcGVjaWZpZWQgdGhhdCwgd2hpY2ggbWVhbnMgd2UgbmVlZCB0byBzcGxp
dCB0aGUgYW5ub3RhdGlvbnMgaW50bwogIGludGVycnVwdGlibGUgYW5kIG5vbi1pbnRlcnJ1cHRp
YmxlIHZlcnNpb24uIElmIHdlIHRoZW4gbWFrZSBzdXJlCiAgdGhhdCB3ZSBvbmx5IHVzZSBpbnRl
cnJ1cHRpYmxlIGRtYV9mZW5jZV93YWl0KCkgY2FsbHMgd2hpbGUgaG9sZGluZwogIGRybV9tb2Rl
c2V0X2xvY2sgd2UgY2FuIGdyYWIgdGhlbSBpbiB0ZHIgY29kZSwgYW5kIGFsbG93IGRpc3BsYXkK
ICByZXNldHMuIERvaW5nIHRoZSBzYW1lIGZvciBkbWFfcmVzdl9sb2NrIG1pZ2h0IGJlIGEgbG90
IGhhcmRlciwgc28KICBidWZmZXIgdXBkYXRlcyBtdXN0IGJlIGF2b2lkZWQuCgogIFdoYXQncyB3
b3JzZSwgd2UncmUgbm90IGdvaW5nIHRvIGJlIGFibGUgdG8gbWFrZSB0aGUgZG1hX2ZlbmNlX3dh
aXQKICBjYWxscyBpbiBtbXUtbm90aWZpZXJzIGludGVycnVwdGlibGUsIHRoYXQgZG9lc24ndCB3
b3JrLiBTbwogIGFsbG9jYXRpbmcgbWVtb3J5IHN0aWxsIHdvbnQnIGJlIGFsbG93ZWQsIGV2ZW4g
aW4gdGRyIHNlY3Rpb25zLiBQbHVzCiAgb2J2aW91c2x5IHdlIGNhbiB1c2UgdGhpcyB0cmljayBv
bmx5IGluIHRkciwgaXQgaXMgcmF0aGVyIGludHJ1c2l2ZS4KCkNjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzogbGludXgt
cmRtYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwg
NSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMKaW5kZXggMDZhNzM2ZTUwNmFkLi5lMzRhNDQzNzZlODcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCkBAIC0yNzksOSArMjc5LDEyIEBA
IHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRvdXQoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQogewogCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQ7CiAJc3RydWN0IGRybV9z
Y2hlZF9qb2IgKmpvYjsKKwlib29sIGZlbmNlX2Nvb2tpZTsKIAogCXNjaGVkID0gY29udGFpbmVy
X29mKHdvcmssIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciwgd29ya190ZHIud29yayk7CiAKKwlm
ZW5jZV9jb29raWUgPSBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygpOworCiAJLyogUHJvdGVj
dHMgYWdhaW5zdCBjb25jdXJyZW50IGRlbGV0aW9uIGluIGRybV9zY2hlZF9nZXRfY2xlYW51cF9q
b2IgKi8KIAlzcGluX2xvY2soJnNjaGVkLT5qb2JfbGlzdF9sb2NrKTsKIAlqb2IgPSBsaXN0X2Zp
cnN0X2VudHJ5X29yX251bGwoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LApAQCAtMzEzLDYgKzMx
Niw4IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRvdXQoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQogCXNwaW5fbG9jaygmc2NoZWQtPmpvYl9saXN0X2xvY2spOwogCWRybV9zY2hl
ZF9zdGFydF90aW1lb3V0KHNjaGVkKTsKIAlzcGluX3VubG9jaygmc2NoZWQtPmpvYl9saXN0X2xv
Y2spOworCisJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7CiB9CiAKICAv
KioKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==

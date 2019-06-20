Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9954D101
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 16:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9455B6E5B8;
	Thu, 20 Jun 2019 14:55:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65076E5B8
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 14:55:20 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s15so3439030qtk.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 07:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ofV3KAT6DyXdgjfHkgArTvp2lu0W0LmsGb2ZeEO+wuU=;
 b=gXTPqIIHOmkqj74tbSKFKTNUqU6F7nolGitsoitXiYxQlTF67aW1Khq5fQLJZwFo+T
 ZypgnTsf5FphCQKabxr+Kf8d0kvqp1SX1+VYcM9Tr5xf1qOu/VG/rupFwYWfmghgjUa8
 jl5SMySHYRkbYe+4ctZXsr2/2HhU+/xPFZRVwuJIfhlkeX//4Dq+njFw79WLgFt4HE24
 0ccOgAiRG7M0TxZz8GEBspLfYLmwwmRy3K88PN2yFqLGAMIsDJyYZcsItllNNf1XLORb
 GX1z6yIVMvhY9Ja7MSaJjSfiL9TRTomsmtlmvKLdLVivyTTQB62tkXmByvF50b1ZL2LU
 yOAQ==
X-Gm-Message-State: APjAAAWBNUtvMVx1okbIrTJvRWbL2h4svvQVh/6pHfltVQcwH0tqaHo0
 sH2Jf4eLOBRilZQBl9oDiR8xFVR6yxmp8zNjGzSqdqHLQ58=
X-Google-Smtp-Source: APXvYqy8M2iDgljYPxa6cx4EjFZdoMkFh2oATuZa95QA3XicEh9zEaxFzqiy4PKpGReaF2Q+Do2N4KtZ3y62+J7IXwc=
X-Received: by 2002:ac8:220a:: with SMTP id o10mr23614008qto.31.1561042519570; 
 Thu, 20 Jun 2019 07:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190620123403.10252-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190620123403.10252-1-nicholas.kazlauskas@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Thu, 20 Jun 2019 15:55:08 +0100
Message-ID: <CAHbf0-HJb79=pLRQZ00rt8+5oHHQO6Oz2eGUU=cRj0FiTrc7xQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true"
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ofV3KAT6DyXdgjfHkgArTvp2lu0W0LmsGb2ZeEO+wuU=;
 b=sJJoy8LPJp5vMXNCk4bsvBsswR+hkQfbn2xVBjHJORud1E4B+NwXWOaZEZhMmgU87J
 TQixUSrnJZEa8r1Vf/pLyKq+ZJhuU5f2B9LXB/XT6XUYq5m0N/opEQKyqARr+QJYbcGt
 +VPf9bq0JZhRPt190vNUp8VsDgYoPNti/dofHFuKPuxkCL5aXuX/iIjfdgautHlOf+NW
 f6CPyATXYclXmxbmCwbZF84BKcpp2hbzmc0wbz96v9egLWFWKm+24xP9JP4fMmGbrPo3
 z9xBxzEDH+G+wv31g9gIVF4Pk3TPoWGOC9jYB2Goh2NZecg7YqEaTga0BaC7GreSoewU
 eVEA==
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
Cc: David Francis <david.francis@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SnVzdCBGWUkgbXkgc3lzdGVtIHdhcyBSYXZlbjEgbm90IFJhdmVuMgoKT24gVGh1LCAyMCBKdW4g
MjAxOSBhdCAxMzozNCwgTmljaG9sYXMgS2F6bGF1c2thcwo8bmljaG9sYXMua2F6bGF1c2thc0Bh
bWQuY29tPiB3cm90ZToKPgo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgZWJjOGM2ZjE4MzIyYWQ1NDI3
NTk5N2E4ODhjYTE3MzFkNzRiNzExZi4KPgo+IFRoZXJlIGFyZSBzdGlsbCBtaXNzaW5nIGNvcm5l
ciBjYXNlcyB3aXRoIGN1cnNvciBpbnRlcmFjdGlvbiBhbmQgdGhlc2UKPiBmYXN0IHBsYW5lIHVw
ZGF0ZXMgb24gUGljYXNzbyBhbmQgUmF2ZW4yIGxlYWRpbmcgdG8gZW5kbGVzcyBQU1RBVEUKPiB3
YXJuaW5ncyBmb3IgdHlwaWNhbCBkZXNrdG9wIHVzYWdlIGRlcGVuZGluZyBvbiB0aGUgdXNlcnNw
YWNlLgo+Cj4gVGhpcyBjaGFuZ2Ugc2hvdWxkIGJlIHJldmVydGVkIHVudGlsIHRoZXNlIGlzc3Vl
cyBoYXZlIGJlZW4gcmVzb2x2ZWQuCj4KPiBDYzogRGF2aWQgRnJhbmNpcyA8ZGF2aWQuZnJhbmNp
c0BhbWQuY29tPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2Fz
QGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwo+IGluZGV4IDMzZGNkNDE4NzE1Ny4uZDZhY2JjZmE1NzBjIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAg
LTY0NzEsNiArNjQ3MSwxNCBAQCBzdGF0aWMgYm9vbCBzaG91bGRfcmVzZXRfcGxhbmUoc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAo+ICAgICAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRl
ICpuZXdfY3J0Y19zdGF0ZTsKPiAgICAgICAgIGludCBpOwo+Cj4gKyAgICAgICAvKgo+ICsgICAg
ICAgICogVE9ETzogUmVtb3ZlIHRoaXMgaGFjayBvbmNlIHRoZSBjaGVja3MgYmVsb3cgYXJlIHN1
ZmZpY2llbnQKPiArICAgICAgICAqIGVub3VnaCB0byBkZXRlcm1pbmUgd2hlbiB3ZSBuZWVkIHRv
IHJlc2V0IGFsbCB0aGUgcGxhbmVzIG9uCj4gKyAgICAgICAgKiB0aGUgc3RyZWFtLgo+ICsgICAg
ICAgICovCj4gKyAgICAgICBpZiAoc3RhdGUtPmFsbG93X21vZGVzZXQpCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiB0cnVlOwo+ICsKPiAgICAgICAgIC8qIEV4aXQgZWFybHkgaWYgd2Uga25vdyB0
aGF0IHdlJ3JlIGFkZGluZyBvciByZW1vdmluZyB0aGUgcGxhbmUuICovCj4gICAgICAgICBpZiAo
b2xkX3BsYW5lX3N0YXRlLT5jcnRjICE9IG5ld19wbGFuZV9zdGF0ZS0+Y3J0YykKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gLS0KPiAyLjE3LjEKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=

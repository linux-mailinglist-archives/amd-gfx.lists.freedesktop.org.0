Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A362FA8
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 06:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7903689DD5;
	Tue,  9 Jul 2019 04:37:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C5289DD5
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 04:37:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id v15so1586502wml.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 21:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jqwkwVE59UJqKjWZ2I2XtyhSam/I8a/ABZ3OJDi+mEo=;
 b=byyjent6ZeeYCEOXMbEFylEXJsUOKjStK9oNtrM0INDuVXSTiXkKqSA6MfdBJXjmSv
 H3yZtAn9FXD9gxZqCp6At25bdV3QLFPZz5J/Hnb4F1SePv6e3zAKgJxfTxmsBNlETREh
 7mUyi2s+S0cn4YBCSh2Bfp+1a3eLTE65Y7i3HCzRSpANyhUu5TS8ULHXzVUoA0leFG4C
 pMl047z/IfzNwzQaw5przr4B/ZuLeh0+ZspO/vPiPxdOUFjZ2oAQNdqt6sPxVLHmyJ0H
 9Ekxfc1PRl0I6inEtWhr3DzW2wyCPaqjt83/wLyk1y5JLrtZvq1G82Mx1hu+5e8o5GNR
 Z0Ag==
X-Gm-Message-State: APjAAAU5iP1hRm/Ovd2rCGZrmlAbUZ+N5prTmlL+xarNSi1cVzbge91r
 Xn07b7VcM92I0TswSPJg+DMUHgqTpI1CLeluZZ8=
X-Google-Smtp-Source: APXvYqwV9a7jGg5wBwTO0xIx0p5O8ueVIgCSBnjlU+xk3d7qiuvY0LTAcvdJwaH54ELDXYewDaDN40mczeKUyx9TXbU=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr20589916wmk.127.1562647019628; 
 Mon, 08 Jul 2019 21:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <f87f3e2f-4d02-4548-3b9f-c012d811ac6b@molgen.mpg.de>
In-Reply-To: <f87f3e2f-4d02-4548-3b9f-c012d811ac6b@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Jul 2019 00:36:48 -0400
Message-ID: <CADnq5_PvHZweyud9FaZL2bve5ytqDgNSF0Dg9ux5=n8jHUK4nQ@mail.gmail.com>
Subject: Re: drm/amdgpu: Print out voltage in DM_PPLIB
To: Paul Menzel <pmenzel+amd-gfx@molgen.mpg.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jqwkwVE59UJqKjWZ2I2XtyhSam/I8a/ABZ3OJDi+mEo=;
 b=gWZoZadSn0lLJKezugAflpCMLI6XKT2WT+Q7/Iu8Twt7uE3LNPDuwOEPSa/4Wbl8E5
 ojZZA9RBw4qaFW/88iF4M1y5QmHk7ulslt7jGj9isY8su6pzD5fZGNIu92/rCGi3+U7T
 HsnntrcGIqp5gHXmJZjcftlf2N99RzuKD+djahAC3rrKs5T0+mFJTVvGTt/LXjVv9SHZ
 vxVinGG3nRhC6+N27GS81cluJLFM4mPFxvzDH/I6UaWdbnmrmnIgkuTL4TiGZR8Qxs3n
 ySlYUo0Ai/LQQdEoLyUu20DlL8IMByQkfyJvy602s2bgxUF2S9aKZtlLg1A3sSUKHx4h
 B5Pg==
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
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCA3OjUwIEFNIFBhdWwgTWVuemVsCjxwbWVuemVsK2FtZC1n
ZnhAbW9sZ2VuLm1wZy5kZT4gd3JvdGU6Cj4KPiBGcm9tOiBQYXVsIE1lbnplbCA8cG1lbnplbEBt
b2xnZW4ubXBnLmRlPgo+IERhdGU6IFN1biwgNyBKdWwgMjAxOSAxNDoyMzowOCArMDIwMAo+Cj4g
QXMgdGhlIGNsb2NrIGlzIGFscmVhZHkgbG9nZ2VkLCBhbHNvIGxvZyB0aGUgdm9sdGFnZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IFBhdWwgTWVuemVsIDxwbWVuemVsQG1vbGdlbi5tcGcuZGU+CgpBcHBs
aWVkLiAgVGhhbmtzLgoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKPiBpbmRleCAz
NTBlN2E2MjBkNDUuLjdmZGYyZjUzYzBlZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jCj4gQEAgLTI5
Miw3ICsyOTIsNyBAQCBzdGF0aWMgdm9pZCBwcF90b19kY19jbG9ja19sZXZlbHNfd2l0aF92b2x0
YWdlKAo+ICAgICAgICAgICAgICAgICAgICAgICAgIERDX0RFQ09ERV9QUF9DTE9DS19UWVBFKGRj
X2Nsa190eXBlKSk7Cj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjbGtfbGV2ZWxfaW5mby0+
bnVtX2xldmVsczsgaSsrKSB7Cj4gLSAgICAgICAgICAgICAgIERSTV9JTkZPKCJETV9QUExJQjpc
dCAlZCBpbiBrSHpcbiIsIHBwX2Nsa3MtPmRhdGFbaV0uY2xvY2tzX2luX2toeik7Cj4gKyAgICAg
ICAgICAgICAgIERSTV9JTkZPKCJETV9QUExJQjpcdCAlZCBpbiBrSHosICVkIGluIG1WXG4iLCBw
cF9jbGtzLT5kYXRhW2ldLmNsb2Nrc19pbl9raHosCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICBwcF9jbGtzLT5kYXRhW2ldLnZvbHRhZ2VfaW5fbXYpOwo+ICAgICAgICAgICAgICAgICBjbGtf
bGV2ZWxfaW5mby0+ZGF0YVtpXS5jbG9ja3NfaW5fa2h6ID0gcHBfY2xrcy0+ZGF0YVtpXS5jbG9j
a3NfaW5fa2h6Owo+ICAgICAgICAgICAgICAgICBjbGtfbGV2ZWxfaW5mby0+ZGF0YVtpXS52b2x0
YWdlX2luX212ID0gcHBfY2xrcy0+ZGF0YVtpXS52b2x0YWdlX2luX212Owo+ICAgICAgICAgfQo+
IC0tCj4gMi4yMi4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

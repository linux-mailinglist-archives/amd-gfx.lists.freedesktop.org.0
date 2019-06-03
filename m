Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225732A31
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 10:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8E89B83;
	Mon,  3 Jun 2019 08:00:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB60089BAB
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 07:59:58 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id d2so6274673ybh.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 00:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P5dh5K0Lha74nCFDebd84OboV0QuYyR0kqM4nrflpoA=;
 b=g99bkQSFse8AczSSwCYw0xrz+qpbDhmxwmZxa3xdRvVuGrdVVuTjJJAd5vbgfSfh7G
 psXlj34e8TLaL0XxQLoY1piQJfOQAS9U+hkULKukfNoCSbNUodegd/GZCn6ySLBgNzWW
 X7UdJhoBIM8mG9BTjeUnNc6m28Bw5FXsI//QjAoEa7ILAV8C9FirZrn9AnLSbXXx0RSX
 Fpc6/ue0UR5/xA5I3iiTMjrvv7k7PzpI4Nz6EUEOiK/cOSxt/GTu+hO0M/058LMnqCY3
 7fqBvwzknEsao1uKP7WsdqxmklW0PHFq7p5u3f25ZmE+PBP/TVjeU+KuGS7IUXOnmO1M
 mQ0g==
X-Gm-Message-State: APjAAAWse06shKnVdWuNkgSkHc2P/RUHb6F8LhFdZ+W4Do+aoN3MMu3O
 S+MuxGJULFXdN/XyS+NJq5cBH6zeHjvySKPXNKWb4g==
X-Google-Smtp-Source: APXvYqzvLiLS1v8XMEg318I2AHlsT02QtoNJjyHWzPZ8fzmwVbLqdZ9eMlLOZUa/KYFVSczsarD6QidBoksXXDZjQOk=
X-Received: by 2002:a25:eb06:: with SMTP id d6mr11553708ybs.402.1559548798001; 
 Mon, 03 Jun 2019 00:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <1559111780-32513-1-git-send-email-flora.cui@amd.com>
 <bc4571fc-6521-74d7-2d5c-1665396b50fc@amd.com>
In-Reply-To: <bc4571fc-6521-74d7-2d5c-1665396b50fc@amd.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Mon, 3 Jun 2019 09:59:46 +0200
Message-ID: <CAD=4a=VXK_2yt1S-FFMucFGxjG7M3-cE6rxi7qP=2qe8p1WSkw@mail.gmail.com>
Subject: Re: [PATCH v2] dri2: reply to client for WaitMSC request in any case
To: "Cui, Flora" <fcui@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P5dh5K0Lha74nCFDebd84OboV0QuYyR0kqM4nrflpoA=;
 b=Zc056nT9I/a+aoa2P1PaV6SNilu7bReDGadSXcbASASyj0xbsWdSNhZ+RBPiOilttq
 24bI/0AQed5rYUzMcOn2vTHA7Mmqyx6jLRSmG1sh6jyATKDFANYyTSt7WoMK8/lMLtfN
 s8MMb7zpJDMiV3ys6D1Tik+ccs6f5cmnzwpebOI/uyGi+LPZbuBOJjGz2WO4e9YxH7ZD
 zblyeielAZVGK6TpAecZLtV9XrhM18+928n/86dVW3IqeErmNZjwcESCnJY6RI/I2hI7
 vsxSxXuXt5xT7ntC/h/WfzEFJS38X+WZ1PdTrQrXL4ZxmE5Hn29KAtXVMQecGgjAdqZc
 wK/Q==
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>, "Daenzer,
 Michel" <Michel.Daenzer@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBsb29rcyBsaWtlIGEgdjIgd2l0aCBzaWxpZ2h0bHkgZGlmZmVyZW50IHNlbWFudGljcz8K
CkRlbiBtw6VuIDMganVuaSAyMDE5IGtsIDA5OjI2IHNrcmV2IEN1aSwgRmxvcmEgPGZjdWlAYW1k
LmNvbT46Cj4KPiBwaW5nLi4uCj4KPiBjb21taXQgNDc2MTNlOGU4ZjRhNWUzYjI1ODMwZTNjMDE1
YTRhMjE3ZmNiZTQ2OQo+IEF1dGhvcjogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4KPiBE
YXRlOiAgIFdlZCBNYXkgMjkgMTQ6MTg6NTAgMjAxOSArMDgwMAo+Cj4gICAgICBkcmkyOiByZXBs
eSB0byBjbGllbnQgZm9yIFdhaXRNU0MgcmVxdWVzdCBpbiBhbnkgY2FzZQo+Cj4gICAgICBvdGhl
cndpc2UgY2xpZW50IHdvdWxkIHdhaXQgZm9yIHJlcGx5IGZvcmV2ZXIgYW5kIGRlc2t0b3AgYXBw
ZWFycyBoYW5nLgo+Cj4gICAgICBTaWduZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBh
bWQuY29tPgo+Cj4gZGlmZiAtLWdpdCBhL3NyYy9hbWRncHVfZHJpMi5jIGIvc3JjL2FtZGdwdV9k
cmkyLmMKPiBpbmRleCA0NDMxNmFjLi5iYjNkOWQwIDEwMDY0NAo+IC0tLSBhL3NyYy9hbWRncHVf
ZHJpMi5jCj4gKysrIGIvc3JjL2FtZGdwdV9kcmkyLmMKPiBAQCAtMTA2Miw2ICsxMDYyLDkgQEAg
c3RhdGljIGludCBhbWRncHVfZHJpMl9zY2hlZHVsZV93YWl0X21zYyhDbGllbnRQdHIKPiBjbGll
bnQsIERyYXdhYmxlUHRyIGRyYXcsCj4gICBvdXRfY29tcGxldGU6Cj4gICAgICAgICAgaWYgKHdh
aXRfaW5mbykKPiAgICAgICAgICAgICAgICAgIGFtZGdwdV9kcmkyX2RlZmVycmVkX2V2ZW50KE5V
TEwsIDAsIHdhaXRfaW5mbyk7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIERSSTJX
YWl0TVNDQ29tcGxldGUoY2xpZW50LCBkcmF3LCB0YXJnZXRfbXNjLCAwLCAwKTsKPiArCj4gICAg
ICAgICAgcmV0dXJuIFRSVUU7Cj4gICB9Cj4KPiDlnKggNS8yOS8yMDE5IDI6MzYgUE0sIEN1aSwg
RmxvcmEg5YaZ6YGTOgo+ID4gb3RoZXJ3aXNlIGNsaWVudCB3b3VsZCB3YWl0IGZvciByZXBseSBm
b3JldmVyIGFuZCBkZXNrdG9wIGFwcGVhcnMgaGFuZy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBG
bG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPgo+ID4gLS0tCj4gPiAgIHNyYy9hbWRncHVfZHJp
Mi5jIHwgMyArKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9zcmMvYW1kZ3B1X2RyaTIuYyBiL3NyYy9hbWRncHVfZHJpMi5jCj4gPiBp
bmRleCA0NDMxNmFjLi4zNDM1M2E3IDEwMDY0NAo+ID4gLS0tIGEvc3JjL2FtZGdwdV9kcmkyLmMK
PiA+ICsrKyBiL3NyYy9hbWRncHVfZHJpMi5jCj4gPiBAQCAtMTA2Miw2ICsxMDYyLDkgQEAgc3Rh
dGljIGludCBhbWRncHVfZHJpMl9zY2hlZHVsZV93YWl0X21zYyhDbGllbnRQdHIgY2xpZW50LCBE
cmF3YWJsZVB0ciBkcmF3LAo+ID4gICBvdXRfY29tcGxldGU6Cj4gPiAgICAgICBpZiAod2FpdF9p
bmZvKQo+ID4gICAgICAgICAgICAgICBhbWRncHVfZHJpMl9kZWZlcnJlZF9ldmVudChOVUxMLCAw
LCB3YWl0X2luZm8pOwo+ID4gKwo+ID4gKyAgICAgRFJJMldhaXRNU0NDb21wbGV0ZShjbGllbnQs
IGRyYXcsIHRhcmdldF9tc2MsIDAsIDApOwo+ID4gKwo+ID4gICAgICAgcmV0dXJuIFRSVUU7Cj4g
PiAgIH0KPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

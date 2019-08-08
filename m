Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB586AA1
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 21:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D62C6E8B2;
	Thu,  8 Aug 2019 19:33:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326676E8B2
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 19:33:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f72so3453073wmf.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 08 Aug 2019 12:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FfnRvT8bsCxQfTxapev0xWL1W1r30LXrZim/pxgudsU=;
 b=SzYfxW5xVnfbjB+l1436Htjd9tPTQewEuVCkFPRNS5NmvYyNuHxtRt5CZ9eQo99bki
 3dwcY/lZ8lgyLuapXEUTTLGQzGi0dT4+QCR3CNrnotZvSVfGL6OttzBoscaQxCOYxU16
 rmJCZJn6orRlsJGr9Y1NmHrDrIqzHuOFtmJdS2Q6QERU0F/HybzBBxe+fgbTGXoSLu/N
 t+hqGx8XjA6UWujrlNAVBrSKjHvandrj74yuUy4hIJqaR6/DaiBejL2Efxh5s+PnayAh
 IhdC5C7ODEM6wNiSS9fc708pxmyuEmSXALiq5sUFfydjjdQyXkv7TMKZxFloYWg+Th0j
 GyeQ==
X-Gm-Message-State: APjAAAUu+UNUNMES9eht4UcxmEpNZTPrHeGekDWE2fTqnFw1c8Y8i8LD
 EZ0S+y0K6mf8VDzRjSyalc76MPj27SuDsIWdG4UCNw==
X-Google-Smtp-Source: APXvYqxYYZWziRgtaG892+kpeNCC9wfJ7Nk7VgPAAR6JgQ9Jg9J6r/T2K7IQ+WDKu0ncIr3q5D9lqT2jiaNIWF2wJGk=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr6501804wmk.127.1565292809753; 
 Thu, 08 Aug 2019 12:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190808192535.GA18697@roeck-us.net>
In-Reply-To: <20190808192535.GA18697@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Aug 2019 15:33:17 -0400
Message-ID: <CADnq5_ONGvL0yMybsXCyYJO6zKRAi4aEPo8LwEwQjSP3aVbdJQ@mail.gmail.com>
Subject: Re: drm/amdgpu: replace readq/writeq with atomic64 operations
To: Guenter Roeck <linux@roeck-us.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FfnRvT8bsCxQfTxapev0xWL1W1r30LXrZim/pxgudsU=;
 b=USK90tVIdJIFVBJZ2H17am399y7k1Utv/BXtZddGo6yJp74+M9f3x25FyBl6tkxpfW
 e+sW8fcQJgN7rhBFguwmJIMhyHfhN1hPlJkPZYC7AcWot2O1OHkTM9iA1E9qD0QilqQ7
 x3PGckwRyI5rLi38dtaInQBPQkjHvF0waQlm3qU4aEteDUtDYTWxa31/sHuT7dHloPkv
 SW5T0EHQxbWDDg+61m+b3qpEE9Y9r8oa4EagA22Z3tC08EKTkRti/nO+UdTtDnEC9Emv
 49SRgpEG23SWIJo+o4oIoqDSOXh4sjt9Izdrt90p4v5CplNKgQQK3CDFIIm1BOVVUYa3
 K+DQ==
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
Cc: kernel-build-reports@lists.linaro.org, Mark Brown <broonie@kernel.org>,
 Tao Zhou <tao.zhou1@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Dennis Li <dennis.li@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCAzOjMxIFBNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAxMDo1Njo0MEFNICsw
ODAwLCBUYW8gWmhvdSB3cm90ZToKPiA+IHJlYWRxL3dyaXRlcSBhcmUgbm90IHN1cHBvcnRlZCBv
biBhbGwgYXJjaGl0ZWN0dXJlcwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8u
emhvdTFAYW1kLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4KPiBSZWdhcmRpbmcgdGhlIGNsYWltIHRoYXQgdGhpcyB3b3VsZCB3
b3JrIGZvciAzMi1iaXQgeDg2IGJ1aWxkczoKCkkgd2Fzbid0IHRhbGtpbmcgYWJvdXQgcmVhZHEv
d3JpdGVxLCBJIHdhcyB0YWxraW5nIGFib3V0IHRoZSBhdG9taWM2NAppbnRlcmZhY2VzLgoKQWxl
eAoKPgo+IG1ha2UgQVJDSD1pMzg2IGFsbG1vZGNvbmZpZwo+IG1ha2UgQVJDSD1pMzg2IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uubwo+Cj4gcmVzdWx0cyBpbjoKPgo+
ICAgLi4uCj4gICBDQyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2Uubwo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYzogSW4gZnVu
Y3Rpb24g4oCYYW1kZ3B1X21tX3JyZWc2NOKAmToKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmM6Mjc5Ojk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBm
dW5jdGlvbiDigJhyZWFkceKAmTsKPgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X21tX3dyZWc2NOKAmToKPiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmM6Mjk4OjM6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh3cml0ZXHigJkKPgo+IFRoaXMgaXMgd2l0aCBu
ZXh0LTIwMTkwODA4Lgo+Cj4gR3VlbnRlcgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

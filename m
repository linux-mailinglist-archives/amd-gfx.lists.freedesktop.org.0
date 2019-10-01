Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9DC3624
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 15:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B44989B5F;
	Tue,  1 Oct 2019 13:45:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FB46E7A3
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 13:45:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z9so2475592wrl.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 01 Oct 2019 06:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Qa9iAeF+EKLwwmLEtQFd5APivMe7Zv4I6NcIUUNoY8=;
 b=IRrKw52G9zv3pKaD18YavZgra27e8TcdMk4fEG7Y+kjVr+BTqrH2/25klDdaxvn6iB
 ejljBUSIqUCxqr0Si/gztX7PuwlAfAk/4U7HKoeQKrzZOKWLSb2WYkfu2G0BnaMbRCfc
 qrecPxpfHkbY8Pz+WAYqz6num+wfZde5ACLQvxR52yXChko2MZdKBA35hJV9pPzcq/XC
 Z3I4I9101BSooXXs37r097gYAeDipt3HeWWG27Hti51XO+vdrIjOZA+sWAMRo3QIHfy7
 vtyeNRe39UOnzVi4EKU2KIf3Bn40Mx7GXCLRN5Du0Sya6hDM7iLFaKAIlvqUyy3Cgcwi
 pL9Q==
X-Gm-Message-State: APjAAAX7ylvJggdBX7ifSvSNkGacTn4msS76sVNWCfsu+Cx37vkKapjM
 y+gmAp+F2If7zL+RRKG1RiHIOUlfiP4aE+4EIL3zg2N6
X-Google-Smtp-Source: APXvYqxdDC/eya+aZfpZOVDyWtIcVcD44ag4aFHcZ+FxAlpgobaNovdoJwDpe1t4LQ3Aki4GiDHRQX4n2hw4R8/ETrg=
X-Received: by 2002:adf:d08b:: with SMTP id y11mr18735964wrh.50.1569937536957; 
 Tue, 01 Oct 2019 06:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAHd=HQGT7duWkYZ+TRWFjpCSryuFBmXEwGKgZ7sGRT29vc92Rw@mail.gmail.com>
In-Reply-To: <CAHd=HQGT7duWkYZ+TRWFjpCSryuFBmXEwGKgZ7sGRT29vc92Rw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Oct 2019 09:45:23 -0400
Message-ID: <CADnq5_Pgze70twq-uswcer91hMHrFwiAyOvsRnbtUXYN+4QDkA@mail.gmail.com>
Subject: Re: Quick question for the mobile Raven Ridge auto-rotate function
To: Sjoerd Bergmans <sbergmans87@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9Qa9iAeF+EKLwwmLEtQFd5APivMe7Zv4I6NcIUUNoY8=;
 b=kQVOlBpt6AgduuPlt1WWR9rVmlvnCInrzNxhiWHPjnsCntrI8QMLunUqr+h718VUV9
 /w/wBoU7kPX+O1crytY6QVv9n9mI0JvugAXcQC3HnAtKiW5oz5VwDG7TqJLfyzIHyewd
 W3ZxJ1Mn6p6dCPpaqjg2bQMxGR75q5dSHMnucjd8KPhwEgjVecPFG/YdvllPWSN8lqSG
 cvWA1Q42Qsw+SKRYJzg9AgzjODLWRptJkwZ2k7OtMWMggLmWvJxKgKZF2moLOG4yljAD
 yJU3/l5ipXq6pKp5QMGZJZMIWXvSFeKjqS1Vh7olQ4B6AAotORUeg+atElh3as5K6GdH
 kTVg==
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMSwgMjAxOSBhdCAzOjQxIEFNIFNqb2VyZCBCZXJnbWFucyA8c2JlcmdtYW5z
ODdAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gUXVpY2sgcXVlc3Rpb24gcmVnYXJkaW5n
IGFuIGVhcmxpZXIgYW5ub3VuY2VtZW50OyBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9h
cmNoaXZlcy9hbWQtZ2Z4LzIwMTktTWF5LzAzNDQzMS5odG1sCj4KPiBJIGZlZWwgYSBsb3Qgb2Yg
TGludXggdXNlcnMgYXJlIHN0aWxsIHdhaXRpbmcgZm9yIHRoZSBzcGVjaWZpZWQgZHJpdmVyIHRv
IHN1cmZhY2UuIFNpbmNlIHlvdSBnYXZlIHRoZSBvcmlnaW5hbCBzdGF0ZW1lbnQsIG1pZ2h0IGl0
IGJlIHlvdSBhcmUgYWJsZSB0byBvZmZlciBhbnkgbmV3IGluc2lnaHRzIG9yIHVwZGF0ZT8KCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngvMjAxOS1TZXB0ZW1i
ZXIvMDQwNTUzLmh0bWwKCkFsZXgKCgo+Cj4gVGhueCEKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D226D5E5
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 22:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D226E462;
	Thu, 18 Jul 2019 20:39:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0E76E462
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 20:39:06 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id k20so53756134ios.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 13:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ud5ljtLJiKuPpVgCtDKOGoe2Bls3IY+c69rJMAry2dE=;
 b=VmPncO6HhWCfsX/J7IG4zVNLGrGXMH7OSpluFCt1Aos5YMtaZxYa22/QgeEo5wf8Pt
 qfP8MbnQ5oZ3DB1nP2fc1zYIDjA73Djw+O/Tn/fcH1+I8il28LWjGkO1mUiA2WWRHZWo
 BNgZsde+d6NfNJfBtDw3CrwIrQzu1d6JJ0f43h3ZVhaGSb8MZdI4jaZTwdCy438C1z0G
 J/h9nK9AFSisYPR5phT6QVXMTqq9gXxMiiE9qPRmhOPDXZ9k5epg4482EzSLtbQxGWAp
 pw8AGagDCXllVXKKVaEXuy83WYeaBbMLixk+QDrcAGabZSigzNo0qQdrcF8pQo9aoR5v
 sYLA==
X-Gm-Message-State: APjAAAWAfddojOP/YaaHDMpKCBzBFdHaOSLSlIc/kh2v9u6RKr795Cs4
 x+BDJcFrdC4RrtHbectW7ORuoYqq6iYBKD0Gm7k=
X-Google-Smtp-Source: APXvYqwvA+s2YUCEhVMv5ppkKOhWqQF7hJFpnlGT4Z76yKd8B5sSchm4ewmNHojgyJMgUWClYsKV4LmvLEKzqEz4uSo=
X-Received: by 2002:a6b:cf17:: with SMTP id o23mr14643581ioa.176.1563482345273; 
 Thu, 18 Jul 2019 13:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsMas72q52GYvH+5Po-KDPfqu74XO_YznqJKnp+-+1Mnww@mail.gmail.com>
 <e92cffb7-6627-6f52-70de-e09d9bdbbe0a@amd.com>
 <CAAxE2A4tM-OoxcnLw14M8aZJLPLnPm2aN4fpTVQX_aUyJ9OBNw@mail.gmail.com>
 <CABXGCsMJKKu6DxvKvD8U6Ffkmt8KinNS96w4ygZ7xaemvEhocg@mail.gmail.com>
 <CAAxE2A6US6YBpESnwqm-EGsDapOVVfbHXxdrkjG1UddFPO0mOQ@mail.gmail.com>
 <CABXGCsOWGpop=5_a6nrRoqWSWagkMg_sYCPL8ZuSuByvcDDu+w@mail.gmail.com>
 <CAAxE2A4Xdsutk=teU=vi_Gnr2tuwinu6_JSfkoqTGwd1NrSpxQ@mail.gmail.com>
 <CABXGCsNpD93nBCWiL0VV_x+7jjY+HMYMbWsswxvHWWZXJaAhTQ@mail.gmail.com>
 <CAAxE2A4fy3MAMV0HzX2Rszf=2nZ923xE+r2tVhZKp18V88cmVg@mail.gmail.com>
In-Reply-To: <CAAxE2A4fy3MAMV0HzX2Rszf=2nZ923xE+r2tVhZKp18V88cmVg@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 19 Jul 2019 01:38:54 +0500
Message-ID: <CABXGCsNVozfecEZ-=-5DpyxrscBi06qKVMcq2wp+-j_kRYNn=A@mail.gmail.com>
Subject: Re: The problem "ring gfx timeout" are experienced yet another AMD
 GPU Vega 8 user
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ud5ljtLJiKuPpVgCtDKOGoe2Bls3IY+c69rJMAry2dE=;
 b=M/MKbyHcrjegeIwPaZZZadH3NKXrNJb/qCw/D2P551tG3Q05yROsIYC9ykIP2qfagS
 SS+609xTnvoAe6WN+jqT5J53GTwNF/Q7khMqZd79j/ByWfFghdUoeIMHFs0QYoFWXJ5a
 kX9DDZrj8lOWN0i1pgrzRsMj6NYohbMR/o6M0BRqhujrkyO+ViGkPBMEz+L7tq6a0bjd
 eTJUr1l0uWUBCDpRI3ombdU/z0iEyMYEK/yDw60sxn7ih3LWjGtkbJtoTsWGnKeKWFaT
 nj4dHIhtTgLP4bMozuYOobxKStmOMDmV4cf0i7CnYou9h01Va13ORTF/KK12qtQVahS/
 UGYA==
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
Cc: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCAzIEp1bCAyMDE5IGF0IDIzOjU3LCBNYXJlayBPbMWhw6FrIDxtYXJhZW9AZ21haWwu
Y29tPiB3cm90ZToKPgo+IEl0IGxvb2tzIGxpa2UgbWVtb3J5IGNvcnJ1cHRpb24uIFlvdSBjYW4g
dHJ5IHRvIGRpc2FibGUgSU9NTVUgaW4gdGhlIEJJT1MuCj4KCldlIGRpc2FibGVkIElPTU1VIGlu
IHRoZSBCSU9TIFsxXS4KQW5kIHdhcyBydW4gdGhlIG1lbW9yeSBjaGVjayB3aXRoIE1lbVRlc3Q4
Ni4KTWVtVGVzdDg2IGRpZCBub3QgZmluZCBhbnkgbWVtb3J5IHByb2JsZW1zIFsyXS4KCkJ1dCBw
cmV2aW91c2x5IHJlcG9ydGVkIGlzc3VlIHdpdGggR1BVIGhhbmdpbmcsIHVuZm9ydHVuYXRlbHks
IGhhcHBlbnMgYWdhaW4uCgpbMTc1NzEuNTc4OTg4XSBhbWRncHUgMDAwMDowODowMC4wOiBbZ2Z4
aHViXSBuby1yZXRyeSBwYWdlIGZhdWx0CihzcmNfaWQ6MCByaW5nOjE1OCB2bWlkOjcgcGFzaWQ6
MzI3NzYsIGZvciBwcm9jZXNzIGhvaTQgcGlkIDkyMjUKdGhyZWFkIGhvaTQ6Y3MwIHBpZCA5MjI2
KQpbMTc1NzEuNTc4OTkyXSBhbWRncHUgMDAwMDowODowMC4wOiAgIGluIHBhZ2Ugc3RhcnRpbmcg
YXQgYWRkcmVzcwoweDAwMDAwMDAwNDQxNjAwMDAgZnJvbSAyNwpbMTc1NzEuNTc4OTk0XSBhbWRn
cHUgMDAwMDowODowMC4wOiBWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUzoweDAwNzAxNTND
ClsxNzU3Ni42MzU2MjJdIFtkcm06YW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFpbCBbYW1kZ3B1
XV0gKkVSUk9SKgpXYWl0aW5nIGZvciBmZW5jZXMgdGltZWQgb3V0LgpbMTc1ODEuNzU1OTQ4XSBb
ZHJtOmFtZGdwdV9kbV9hdG9taWNfY29tbWl0X3RhaWwgW2FtZGdwdV1dICpFUlJPUioKV2FpdGlu
ZyBmb3IgZmVuY2VzIHRpbWVkIG91dC4KWzE3NTgxLjc2NTY3Ml0gW2RybTphbWRncHVfam9iX3Rp
bWVkb3V0IFthbWRncHVdXSAqRVJST1IqIHJpbmcgZ2Z4CnRpbWVvdXQsIHNpZ25hbGVkIHNlcT0x
NTIwMzQ1LCBlbWl0dGVkIHNlcT0xNTIwMzQ3ClsxNzU4MS43NjU3NjVdIFtkcm06YW1kZ3B1X2pv
Yl90aW1lZG91dCBbYW1kZ3B1XV0gKkVSUk9SKiBQcm9jZXNzCmluZm9ybWF0aW9uOiBwcm9jZXNz
IGhvaTQgcGlkIDkyMjUgdGhyZWFkIGhvaTQ6Y3MwIHBpZCA5MjI2ClsxNzU4MS43NjU3NjZdIFtk
cm1dIEdQVSByZWNvdmVyeSBkaXNhYmxlZC4KWzE3NTg2Ljg3NTc4M10gW2RybTphbWRncHVfZG1f
YXRvbWljX2NvbW1pdF90YWlsIFthbWRncHVdXSAqRVJST1IqCldhaXRpbmcgZm9yIGZlbmNlcyB0
aW1lZCBvdXQuClsxNzU5Mi4wMDU4MzZdIFtkcm06YW1kZ3B1X2pvYl90aW1lZG91dCBbYW1kZ3B1
XV0gKkVSUk9SKiByaW5nIGdmeAp0aW1lb3V0LCBzaWduYWxlZCBzZXE9MTUyMDM0NSwgZW1pdHRl
ZCBzZXE9MTUyMDM0NwpbMTc1OTIuMDA1OTIxXSBbZHJtOmFtZGdwdV9qb2JfdGltZWRvdXQgW2Ft
ZGdwdV1dICpFUlJPUiogUHJvY2VzcwppbmZvcm1hdGlvbjogcHJvY2VzcyBob2k0IHBpZCA5MjI1
IHRocmVhZCBob2k0OmNzMCBwaWQgOTIyNgpbMTc1OTIuMDA1OTIzXSBbZHJtXSBHUFUgcmVjb3Zl
cnkgZGlzYWJsZWQuCgoKTm8gbW9yZSBpZGVhcyBvbiBob3cgbWVtb3J5IG1heSBiZSBjb3JydXB0
ZWQ/CgpGcmVzaCBsb2dzIHVwbG9hZGVkIGhlcmUgWzNdLgoKVGhhbmtzLgoKWzFdIGh0dHBzOi8v
cG9zdGltZy5jYy9SSkxZV2dINwpbMl0gaHR0cHM6Ly9wb3N0aW1nLmNjL0ZrNHFGTTdGClszXSBo
dHRwczovL21lZ2EubnovI0YhOHhwaGpBSkwhN0hWVXotTnlSYUlDakNTdV94LWZGQQoKLS0KQmVz
dCBSZWdhcmRzLApNaWtlIEdhdnJpbG92LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=

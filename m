Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6AB490C
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 10:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EB96EB4A;
	Tue, 17 Sep 2019 08:18:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237FB6EB4A
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 08:18:11 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id g13so2247047otp.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 01:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9aBAadc0dM/JQVde/IosFu9GDWEy6WahKAl2FnjfciY=;
 b=hB5r9DvoEFulh9eAUyCIL0pxbE3sr805xcplT1gAkkkHv8F8CITIlnR6e3qGsQSmHa
 KSns5SRFqQ0vCXfidjTFzl0JeGdSCsWnTZ143V+A7fa+7puhqeBf/6cTIp0IQtJdJe43
 Tp24blDqq2+BvuGr5DNWB+lxciIogI0G6uTCLQQEglfGZFR5SL3FjC5gFVyOCZzEGfBh
 h69ITqcMljM4FM4ONTNqtwahbvqUipDbYzsovRgwD+yLSZJocAiRs4JMRlEncS9OtLLk
 7mbgQUS1PmFeI58JqaMzJhtXNBsB5w42dP+m6fA+8wdnnicPhPZsc2htJx1pS3HNnZ2K
 Y4Jw==
X-Gm-Message-State: APjAAAWcVgqpgqMYFCA0JkWZ5yywjqtQxG0Svw/SeTsQsWBmu1mh3BOq
 5QPxHkWNdJLHee9Ezq7LhWiFv3pjaS5bjmb6kxUo+Q==
X-Google-Smtp-Source: APXvYqxUk4eJK4/7uLZjoMC61e5Cf4jAIRRyV+Y3bU44fne+SfGJzEQY9cIKANr46ndPNs6gdPToaFNZS9ztiezeWSM=
X-Received: by 2002:a05:6830:10d8:: with SMTP id
 z24mr1848408oto.281.1568708290296; 
 Tue, 17 Sep 2019 01:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
In-Reply-To: <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 17 Sep 2019 10:17:58 +0200
Message-ID: <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
Subject: Re: [PATCH] drm: add drm device name
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9aBAadc0dM/JQVde/IosFu9GDWEy6WahKAl2FnjfciY=;
 b=PehAG47I1mia6yDlsAHYxKUQxo+x8zx8aFLyfKhKACXR2zMRH5AevF8+WW6FbX12LE
 a9RnhzLNT20KNLdSSlnCdeywS6rj69ZUrP8/zlhl+E2BYtd9qh006fJ7na72MijYLoo2
 ULFwGx9Nsq3hlcR1rxB/nnEALXNP5K/zgZq8k=
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTA6MTIgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQW0gMTcuMDkuMTkgdW0gMDc6
NDcgc2NocmllYiBKYW5pIE5pa3VsYToKPiA+IE9uIE1vbiwgMTYgU2VwIDIwMTksIE1hcmVrIE9s
xaHDoWsgPG1hcmFlb0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+IFRoZSBwdXJwb3NlIGlzIHRvIGdl
dCByaWQgb2YgYWxsIFBDSSBJRCB0YWJsZXMgZm9yIGFsbCBkcml2ZXJzIGluCj4gPj4gdXNlcnNw
YWNlLiAob3IgYXQgbGVhc3Qgc3RvcCB1cGRhdGluZyB0aGVtKQo+ID4+Cj4gPj4gTWVzYSBjb21t
b24gY29kZSBhbmQgbW9kZXNldHRpbmcgd2lsbCB1c2UgdGhpcy4KPiA+IEknZCB0aGluayB0aGlz
IHdvdWxkIHdhcnJhbnQgYSBoaWdoIGxldmVsIGRlc2NyaXB0aW9uIG9mIHdoYXQgeW91IHdhbnQK
PiA+IHRvIGFjaGlldmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+Cj4gQW5kIG1heWJlIGV4cGxp
Y2l0bHkgY2FsbCBpdCB1YXBpX25hbWUgb3IgZXZlbiB1YXBpX2RyaXZlcl9uYW1lLgoKSWYgaXQn
cyB1YXBpX25hbWUsIHRoZW4gd2h5IGRvIHdlIG5lZWQgYSBuZXcgb25lIGZvciBldmVyeSBnZW5l
cmF0aW9uPwpVc2Vyc3BhY2UgZHJpdmVycyB0ZW5kIHRvIHNwYW4gYSBsb3QgbW9yZSB0aGFuIGp1
c3QgMSBnZW5lcmF0aW9uLiBBbmQKaWYgeW91IHdhbnQgdG8gaGF2ZSBwZXItZ2VuZXJhdGlvbiBk
YXRhIGZyb20gdGhlIGtlcm5lbCB0byB1c2Vyc3BhY2UsCnRoZW4gaW1vIHRoYXQncyBtdWNoIGJl
dHRlciBzdWl0ZWQgaW4gc29tZSBhbWRncHUgaW9jdGwsIGluc3RlYWQgb2YKdHJ5aW5nIHRvIGVu
Y29kZSB0aGF0IGludG8gdGhlIGRyaXZlciBuYW1lLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0
OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==

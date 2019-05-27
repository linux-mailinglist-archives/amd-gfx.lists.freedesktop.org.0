Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20C2C84F
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 16:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC12B89DF7;
	Tue, 28 May 2019 14:09:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C94689B65
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 14:58:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id t5so16091394wmh.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 07:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:message-id:mime-version;
 bh=cWjK2P4M0BEELpqrdb1v0CI9+VHveovAEJ8c2epynbc=;
 b=DarAGNB8fIB7H29zGVRDxui9yeQbfiBfPABp6KeqX5dm/NYV8rbG+IXDvValnNje/g
 jSEpAfGiwkBd/nBKNs4Sc+NSCL/qMS86DKT+r5MKynXs4hOvYNbcpIHhlXGVX/x2KEiP
 Yj2i+i5saAi50AWyXpXG/r0BKt8XJ9uRZBOgsAysU82O7WFKMecZba12IWCxQbIvPwLs
 tv6xz+FCO9woQJCwFb4DHSgZ60KxmHdfJdtshPF1paPpkfyyYrQdTKQBoa9BaolNjNEs
 L35Ec+8PjXt/Bl1zXhOXBRV/KOT3NfUe9nEl33OsFgsZtrwnfhJb3a6L2WDkMKPbGLKc
 +XaQ==
X-Gm-Message-State: APjAAAUJ39EPwKiXKq4N4tXdb8CI4xYQss0hh3PNFU74sAqORY5Q+Y6P
 G4iAELhQpEQt5JZNuDNvRV3/QSbtiqw=
X-Google-Smtp-Source: APXvYqwpf0s1igxvFp0NWXFfzGFNVcNnSmXnE0okmQGTg9NscYom7JqCQgC29QxnvpkZrtuIlYnQWg==
X-Received: by 2002:a1c:ed16:: with SMTP id l22mr10556301wmh.96.1558969132576; 
 Mon, 27 May 2019 07:58:52 -0700 (PDT)
Received: from bureau-gael ([2a02:c441:bb8:1:d250:99ff:fe2c:cc3f])
 by smtp.gmail.com with ESMTPSA id x68sm12445027wmf.13.2019.05.27.07.58.51
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 07:58:51 -0700 (PDT)
Date: Mon, 27 May 2019 16:58:50 +0200
From: =?iso-8859-1?b?R2HrbA==?= HERMET <linuzel@gmail.com>
Subject: RX 580 and 5K displays, bandwidth validation failed whith multiple
 monitors
To: amd-gfx@lists.freedesktop.org
Message-Id: <1558969130.2.0@gmail.com>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 May 2019 14:09:32 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:subject:to:message-id:mime-version;
 bh=cWjK2P4M0BEELpqrdb1v0CI9+VHveovAEJ8c2epynbc=;
 b=rfE3XQy1arodn6WjHFuf1z7x3bAqq7cgsS2p3DnFU1DcVvS+mxQqbsmuYTgU9JkEbO
 2srfKmbSRdfjKsZ9JmeWrX3HGC9TGJBYlnVjkicekTRu/Ux2lIXyp2g8rwi8XYJn7G+P
 k/HqdFVlzELoQ0pzDKpmV382Cyv0FWaNh0RHnPVjF2RmV0yoxu8kmPeoJ8auCKDcgqtr
 iFDOn7DkbGX1RMemXoF+hXZlfs0L51FZyaIaTLDHgJOItZgrw6U1D5XPtpZaxuZJJGPF
 Ivpu350Uf8SnPSOVGCRz+dmRGmMYT+0p7DbyKTkDqvNZcytdfCPvm1OfryFlequlGLa4
 CRyw==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgpJIGhhdmUgYmVlbiBmYWNpbmcgYW4gaXNzdWUgd2l0aCBteSA1SyBkaXNwbGF5IChpaXlh
bWEgUHJvTGl0ZSAKWEIyNzc5UVFTLVMxKS4KCkl0IHdvcmtzIGZpbmUgYXMgbG9uZyBhcyBpdCBp
cyB0aGUgb25seSBhY3RpdmUgbW9uaXRvciwgYXMgc29vbiBhcyBJIAphY3RpdmF0ZSBhbm90aGVy
IG1vbml0b3IgdGhlIG1haW4gb25lICg1aykgY2FuJ3QgZGlzcGxheSBtb3JlIHRoYW4gNGsuCgpE
ZWJ1ZyB1c2luZyAiZWNobyAweDQgPiAvc3lzL21vZHVsZS9kcm0vcGFyYW1ldGVycy9kZWJ1ZyIg
c2hvdyB0aGlzIDoKbWFpIDIzIDA5OjAxOjIyIGJ1cmVhdS1nYWVsIC91c3IvbGliL2dkbTMvZ2Rt
LXgtc2Vzc2lvblszNDY1XTogKEVFKSAKQU1ER1BVKDApOiBmYWlsZWQgdG8gc2V0IG1vZGU6IElu
dmFsaWQgYXJndW1lbnQKbWFpIDIzIDA5OjAxOjIyIGJ1cmVhdS1nYWVsIGtlcm5lbDogW2RybTpk
Y2UxMTJfdmFsaWRhdGVfYmFuZHdpZHRoIApbYW1kZ3B1XV0gZGNlMTEyX3ZhbGlkYXRlX2JhbmR3
aWR0aDogQmFuZHdpZHRoIHZhbGlkYXRpb24gZmFpbGVkIQoKSSBkaXNhYmxlZCB0aGUgY2hlY2sg
YnkgZm9yY2luZyBpc19kaXNwbGF5X2NvbmZpZ3VyYXRpb25fc3VwcG9ydGVkIHRvIApyZXR1cm4g
dHJ1ZSBpbiBkY2VfY2FsY3MuYyBhbmQgaXQgd29ya3MgZmluZS4KCkFueXRoaW5nIEkgY2FuIGRv
IHRvIGNvcnJlY3QgdGhpcyBiYW5kd2lkdGggY2FsY3VsYXRpb24gPwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99D12FFB
	for <lists+amd-gfx@lfdr.de>; Fri,  3 May 2019 16:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A6B891E1;
	Fri,  3 May 2019 14:20:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547D988BE3
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 May 2019 14:20:27 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id q65so7868143itg.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 03 May 2019 07:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wy9a/0xhVW8Co5sCenWGjk0UjI70ILgKda7I6MLzKaQ=;
 b=IBjlC05HT2ogeI2GeeSJMGfpUxYOoEt9RrarFYgOIHyqgTHWb6VHY0QiQzT+OWq+rS
 2B43MkF9UjRNFMZKxBcVSjfPwIuDlhARNsQjAx9iTH9HFIfVDQiSOQ/G7aFHcxYMz68/
 X3K9uo4qKyoHP/jRUIu0GSFPdERXvwJuybi01nwXdLpqOGTpxirQpbIF8SkaHR6/2OgF
 gxp6WdTQj1kt7RQqxPwtnbb8PSB5QSLVgP9LFS3/849m6bHWjqnX5sQCeEvFvPWnuW0l
 esCQZ9N1kfmlDh/i3RvKTgP/bGpvmi4KsmGsDlhIQ7YdCvOw2HD/374E/HDazFSVkrDg
 6sjQ==
X-Gm-Message-State: APjAAAULgEIOQsu8om968pCZdE4o+Jnaui7FOhjndvyz5beEdJoEfvgX
 tQPYniyRLRhc+fKtkvN7EGw+jiKIp0+/hsfr8uH2gqybMAuoJA==
X-Google-Smtp-Source: APXvYqzmKuINhLdlX8CDflWwZbHdP4rjCbdq5X9kPNO8rck+/K/D00f0HSwfv0+Xwl3AIZ+IGyk5CWKnFRFJ8rOUT0g=
X-Received: by 2002:a05:660c:78a:: with SMTP id
 h10mr7596308itk.157.1556893226239; 
 Fri, 03 May 2019 07:20:26 -0700 (PDT)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 3 May 2019 19:20:15 +0500
Message-ID: <CABXGCsMY=LvtCp0V8U8jbARXgapjQe4WP9ss-ui3fHsPQjevXg@mail.gmail.com>
Subject: How to dump gfx and waves after GPU reset happened?
To: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tom St Denis <tom.stdenis@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wy9a/0xhVW8Co5sCenWGjk0UjI70ILgKda7I6MLzKaQ=;
 b=lrj13pXsNriz3EbkiaUsfWAAGsWdFjLCCvxs/OhWVoo5hJCaDjNjZXcu5ousYNUh3y
 Y82vq0O62nhNQDpHEezVLY0eLjNsN7l+fOV9G7KANhFuGZQSdyNmgtIO86NLtKxnRiG2
 zp932ZA7juBSBWZ59Fm4z7H2HjaITUPgoRtS46GfiH74ecPpFyuP4JPOgDcV9JAPoyMT
 C8f1FTOwBp03VhtiQvF6+GrjojW5aSgElf39BTBLaAXHvsMMJv8fxupJb2l6QHem420i
 7Usc6Bj8vxKk6KRqAp0O57gpz3/6eK9JdwzewSqjsrO5fcSQnup6KEetv4WH/wJEC6+i
 bC/g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgZm9sa3MuCkkgdHJpZXMgcGxheSBpbiBSZXNpZGVudCBFdmlsIDIgcmVtYWtlIHZpYSBzdGVh
bSBwbGF5IGFuZCBteSBSYWRlb24gNwooVmVnYSAyMCkgY2FyZCBpcyBleHBlcmllbmNlZCAicmlu
ZyBnZnggdGltZW91dCIgcHJvYmxlbSBldmVyeSB0aW1lCndoZW4gSSBzZWxlY3QgIlN0b3J5IiBp
biB0aGUgbWFpbiBnYW1lIG1lbnUuClNpbmNlIEkgYW0gc2l0dGluZyBvbiA1LjEga2VybmVsIG5v
dyBHUFUgcmVzZXQgb2NjdXJyZWQgZXZlcnkgdGltZQp3aGVuIGhhcHBlbmVkICJyaW5nIGdmeCB0
aW1lb3V0Ii4KU28gbXkgcXVlc3Rpb246IEhvdyB0byBkdW1wIGdmeCBhbmQgd2F2ZXMgYWZ0ZXIg
R1BVIHJlc2V0IGhhcHBlbmVkPyBJCnNlZSB0aGF0IGFmdGVyIEdQVSByZXNldCBpcyBub3RoaW5n
IHRvIGR1bXAuCgojIC4vdW1yIC1PIGhhbHRfd2F2ZXMgLXdhCltXQVJOSU5HXTogUmluZ3MgYXJl
IG5vdCBoYWx0ZWQhICBVc2UgJy1PIGRpc2FzbV9hbnl3YXlzJyB0byBlbmFibGUKZGlzYXNzZW1i
bHkgd2l0aG91dCBoYWx0ZWQgcmluZ3MKTm8gYWN0aXZlIHdhdmVzIQoKIyAuL3VtciAtUiBnZnhb
Ll0KCnZlZ2EyMC5nZngucnB0ciA9PSAyNTYKdmVnYTIwLmdmeC53cHRyID09IDI1Ngp2ZWdhMjAu
Z2Z4LmRydl93cHRyID09IDI1Ngp2ZWdhMjAuZ2Z4LnJpbmdbIDIyNV0gPT0gMHhmZmZmMTAwMCAg
ICAuLi4KdmVnYTIwLmdmeC5yaW5nWyAyMjZdID09IDB4ZmZmZjEwMDAgICAgLi4uCnZlZ2EyMC5n
ZngucmluZ1sgMjI3XSA9PSAweGZmZmYxMDAwICAgIC4uLgp2ZWdhMjAuZ2Z4LnJpbmdbIDIyOF0g
PT0gMHhmZmZmMTAwMCAgICAuLi4KdmVnYTIwLmdmeC5yaW5nWyAyMjldID09IDB4ZmZmZjEwMDAg
ICAgLi4uCnZlZ2EyMC5nZngucmluZ1sgMjMwXSA9PSAweGZmZmYxMDAwICAgIC4uLgp2ZWdhMjAu
Z2Z4LnJpbmdbIDIzMV0gPT0gMHhmZmZmMTAwMCAgICAuLi4KdmVnYTIwLmdmeC5yaW5nWyAyMzJd
ID09IDB4ZmZmZjEwMDAgICAgLi4uCnZlZ2EyMC5nZngucmluZ1sgMjMzXSA9PSAweGZmZmYxMDAw
ICAgIC4uLgp2ZWdhMjAuZ2Z4LnJpbmdbIDIzNF0gPT0gMHhmZmZmMTAwMCAgICAuLi4KdmVnYTIw
LmdmeC5yaW5nWyAyMzVdID09IDB4ZmZmZjEwMDAgICAgLi4uCnZlZ2EyMC5nZngucmluZ1sgMjM2
XSA9PSAweGZmZmYxMDAwICAgIC4uLgp2ZWdhMjAuZ2Z4LnJpbmdbIDIzN10gPT0gMHhmZmZmMTAw
MCAgICAuLi4KdmVnYTIwLmdmeC5yaW5nWyAyMzhdID09IDB4ZmZmZjEwMDAgICAgLi4uCnZlZ2Ey
MC5nZngucmluZ1sgMjM5XSA9PSAweGZmZmYxMDAwICAgIC4uLgp2ZWdhMjAuZ2Z4LnJpbmdbIDI0
MF0gPT0gMHhmZmZmMTAwMCAgICAuLi4KdmVnYTIwLmdmeC5yaW5nWyAyNDFdID09IDB4ZmZmZjEw
MDAgICAgLi4uCnZlZ2EyMC5nZngucmluZ1sgMjQyXSA9PSAweGZmZmYxMDAwICAgIC4uLgp2ZWdh
MjAuZ2Z4LnJpbmdbIDI0M10gPT0gMHhmZmZmMTAwMCAgICAuLi4KdmVnYTIwLmdmeC5yaW5nWyAy
NDRdID09IDB4ZmZmZjEwMDAgICAgLi4uCnZlZ2EyMC5nZngucmluZ1sgMjQ1XSA9PSAweGZmZmYx
MDAwICAgIC4uLgp2ZWdhMjAuZ2Z4LnJpbmdbIDI0Nl0gPT0gMHhmZmZmMTAwMCAgICAuLi4KdmVn
YTIwLmdmeC5yaW5nWyAyNDddID09IDB4ZmZmZjEwMDAgICAgLi4uCnZlZ2EyMC5nZngucmluZ1sg
MjQ4XSA9PSAweGZmZmYxMDAwICAgIC4uLgp2ZWdhMjAuZ2Z4LnJpbmdbIDI0OV0gPT0gMHhmZmZm
MTAwMCAgICAuLi4KdmVnYTIwLmdmeC5yaW5nWyAyNTBdID09IDB4ZmZmZjEwMDAgICAgLi4uCnZl
Z2EyMC5nZngucmluZ1sgMjUxXSA9PSAweGZmZmYxMDAwICAgIC4uLgp2ZWdhMjAuZ2Z4LnJpbmdb
IDI1Ml0gPT0gMHhmZmZmMTAwMCAgICAuLi4KdmVnYTIwLmdmeC5yaW5nWyAyNTNdID09IDB4ZmZm
ZjEwMDAgICAgLi4uCnZlZ2EyMC5nZngucmluZ1sgMjU0XSA9PSAweGZmZmYxMDAwICAgIC4uLgp2
ZWdhMjAuZ2Z4LnJpbmdbIDI1NV0gPT0gMHhmZmZmMTAwMCAgICAuLi4KdmVnYTIwLmdmeC5yaW5n
WyAyNTZdID09IDB4YzAwMzIyMDAgICAgcndECgoKLS0KQmVzdCBSZWdhcmRzLApNaWtlIEdhdnJp
bG92LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

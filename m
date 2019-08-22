Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801AE98DF6
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 10:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E63D6EAAC;
	Thu, 22 Aug 2019 08:39:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170D16EAAC
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 08:39:27 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id f19so3045074plr.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 01:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tpfP5pZ+BRQs8l7iu/t+QE6tLRc0UxLByFTo2SezWfM=;
 b=TY0mDkqX5qeoh2IdkJ/Qe8K4wY9MYuG1ZvnyDltgWpY2Si+Qg/Z2g3eoL2sCEew5A3
 Ht1YKcJeW1tuF9kcEHW2qCrE48SPLjCQ6igekfq/r/Q4kED97vaxXTkKYjMjjT/7iVhS
 ipLHYokCnKy/+M7ZG8t3jUApFEq06JosQiQVG9vlzenaLhkNnNxagaU1reOq36LOM4cS
 Hd23Ewkg77aDKW4oR3AJr/ZGCBufvmhVrkJMRgfG5HYKarLvSMor5XVp23JjYzK+tslm
 SLKB056GvSxAtMfd2Sz5mZXnUvWKsbQwUePGz6ccdFAkJoYUPIyudpI4Oz5DhQSyQYgs
 Ejsw==
X-Gm-Message-State: APjAAAUBLIH5U+g1UcoBKCgxx3+vuvYUfUIHnv67u5L1kG7xiSl5fCxv
 3mb+cW8Wtd8bQ1t4RFhsRn1WdzBrMe1aD/ECNIF7fyWD
X-Google-Smtp-Source: APXvYqy8+oG1noUbwJ9XvjYfPNR9S4NvGDdjb+mns2xKawLFGHDRvRJZHpYEzQ7XzPeHoD/EluG/Iml776or/BB1B7Q=
X-Received: by 2002:a17:902:e493:: with SMTP id
 cj19mr37691333plb.292.1566463166203; 
 Thu, 22 Aug 2019 01:39:26 -0700 (PDT)
MIME-Version: 1.0
From: Clemens Eisserer <linuxhippy@gmail.com>
Date: Thu, 22 Aug 2019 10:39:15 +0200
Message-ID: <CAFvQSYT+Qd8_tE7yvnjLt8RAduAEwUOuh3rvh0X7e3--LqQ78w@mail.gmail.com>
Subject: atombios stuck executing D850 when trying to switch to 4k@60Hz on
 Polaris10
To: amd-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tpfP5pZ+BRQs8l7iu/t+QE6tLRc0UxLByFTo2SezWfM=;
 b=p4Z+n3G046o/5BWttRPWYIVyLeTI4mUNfhws3C3wNEW/jhKoohoS2IsaowLpge54xv
 PP6whfVgBn9nCTghrvFbQRYyYLB3jJ9nh+3Q5SIZ3jWmRWAJSdW/INJin0fqvEmb9WXr
 jmFyIiR9ezRbtKDPGShIAuWsTgke9pGNDb5TKcd2mOcQ8MvjN9vrXtAVzscxGdNjEQHl
 plNA9sO9ETO344jxRCYM7EangA8bGSHabeM1maADWivLRVVv5fsUdTpO17KX/LB29Ygt
 x5J4JxxHpLLQdEFGQVcVkRzrsSoni3ZkRGx6zdUWQqVb1+4u5/t7KSKV+cChg2yFC7Xs
 uv/g==
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

SGkgdGhlcmUsCgpJIGFtIHRyeWluZyB0byBjb25uZWN0IGEgTEcgMzJVRDU5IFVIRCBtb25pdG9y
IHRvIGEgTVNJIEFybW9yIFJYNTcwIDRHCmNhcmQgdmlhIGEgSERNSTIgKGNoZWFwKSBjZXJ0aWZp
ZWQgY2FibGUuClVuZm91cnR1bmF0bHkgdGhlIHNldHVwIG9ubHkgcnVucyBhdCAzMEh6LCB3aGVy
ZWFzIHdoZW4gYm9vdGluZwpXaW5kb3dzIGl0IGF1dG9tYXRpY2FsbHkgc2VsZWN0cyAzODQweDIx
NjBANTlIei4KCkkgcGxheWVkIGEgYml0IHdpdGggYWRkaW5nIHRoZSBtb2RlbGluZXMgbWFudWFs
bHksIGhvd2V2ZXIgd2hlbgplbmFibGluZyB0aG9zZSBuZXcgbW9kZXMgdGhlIHNjcmVlbiBnb2Vz
IGJsYWNrIGFuZCBpbiBzeXNsb2cgSSBmaW5kCnRoZSBmb2xsb3dpbmcgZW50cmllczoKClsgIDU3
MS4xNzQ4MTNdIFtkcm06YXRvbV9vcF9qdW1wIFthbWRncHVdXSAqRVJST1IqIGF0b21iaW9zIHN0
dWNrIGluCmxvb3AgZm9yIG1vcmUgdGhhbiA1c2VjcyBhYm9ydGluZwpbICA1NzEuMTc0ODYyXSBb
ZHJtOmFtZGdwdV9hdG9tX2V4ZWN1dGVfdGFibGVfbG9ja2VkIFthbWRncHVdXSAqRVJST1IqCmF0
b21iaW9zIHN0dWNrIGV4ZWN1dGluZyBEODUwIChsZW4gODI0LCBXUyAwLCBQUyAwKSBAIDB4RDk5
MgpbICA1NzEuMTc0OTA4XSBbZHJtOmFtZGdwdV9hdG9tX2V4ZWN1dGVfdGFibGVfbG9ja2VkIFth
bWRncHVdXSAqRVJST1IqCmF0b21iaW9zIHN0dWNrIGV4ZWN1dGluZyBENzBBIChsZW4gMzI2LCBX
UyAwLCBQUyAwKSBAIDB4RDdBNgoKWG9yZy4wLmxvZzogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vTG1a
MGJ2eUwKa2VybmVsIGxvZzogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vclhHVk1UblYKCkhlbHAgd291
bGQgYmUgcmVhbGx5IGFwcHJlY2lhdGVkIC0gSSBhbSByYXRoZXIgbGF0ZW5jeSBzZW5zaXRpdmUg
YW5kCnRob3NlIDMwSHogYXJlIGRyaXZpbmcgbWUgbnV0cyA7KQoKQmVzdCByZWdhcmRzLCBDbGVt
ZW5zCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

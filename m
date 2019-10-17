Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C5DAF49
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 16:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD60D6E492;
	Thu, 17 Oct 2019 14:11:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD126EAAD
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 14:11:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o28so2534886wro.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 07:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2WzcZXT3TZlnedJVpOXQ9fqAsIxHoHXUwlqYr1hGQQY=;
 b=uUT6eG8qlCWj4eRMCbtAeJ2/pu3X2MitR6j/dTEgWSOenZSYeUROOIsXaxe4T+t9j/
 Q+WZYhtECBdOOFrNv+VMmnhNvxuGzpn2nWjAE9nEhNyMH/m0bEd3ZlwrQEIF6oj4tU+N
 I5ZNDfoOwcll8b4fB+gdDh147Sx3YEmiNgBq83oubDXVJUiL87WecII2ndULwDrYrFuc
 rZgbSzJVG7aiFSIPjjVgkQhnfCpV/MtZ8riw/jf2a6l6X9dIpnuRUyyQiFy6dqgu0VpT
 tOWzGI5bbI98XYMpF19cPcrGrI5brG/ihIyDFXfuTbmeTM5tOtZiVnrQDobe0Xvt4T4y
 wWnQ==
X-Gm-Message-State: APjAAAX+upfz4T/GmfPvcEFqvDnWjSIMp/fNzdRjwGOtkA2cnppWR1gf
 bgr2y3u9TEjohCQivxRuVGldJmu1nzZr4PM0xx7ATsjZqTs=
X-Google-Smtp-Source: APXvYqxkj7vRF41S1ueATYOluXsi3pCL76gm+5nO88+6FoBDRgtQ41zz7Xltprbfdh3Z/l6dHSSnhdVET2vO6tnSxHg=
X-Received: by 2002:a5d:6785:: with SMTP id v5mr528362wru.174.1571321505502;
 Thu, 17 Oct 2019 07:11:45 -0700 (PDT)
MIME-Version: 1.0
From: Sylvain Munaut <246tnt@gmail.com>
Date: Thu, 17 Oct 2019 16:12:06 +0200
Message-ID: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
Subject: Spontaneous reboots when using RX 560
To: amd-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2WzcZXT3TZlnedJVpOXQ9fqAsIxHoHXUwlqYr1hGQQY=;
 b=SMxknopWmoKlm0FTF6n2RGxpr4PbXeGsAm5hsPO9DCQAjnsqbIUpWy7I+HIr1nwJ8v
 foh745JGd64Ym/mRdOKkXUvw1YNw1ODgkU5rxduiJieHDoGx0loa26WqBpEQxKgKbpi0
 ZHWwvzTw1Ppz/mWUahhXN6xh/54xZ6IN4ZeZox+8JJi4zw9qIWHpZNbgyYf+PTbommuA
 s2NkeZHt2c1eyse6bdpczWcVylSFO7zW3oasL3AY7Ij72T5C9x8fAopnlCpJXVuOPe7D
 cCWds9asPdxElNQvbdSxWAYcy1RWqkMBDh4FE2sm8eRKo+vyAD2fqgBSFOA+dHmVLdEY
 ucwg==
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

SEksCgpJIGhhdmUgUlggNTYwIDJHIGNhcmQuIEl0J3MgcGx1Z2dlZCBpbnRvIGEgMTZ4IHBoeXNp
Y2FsIC8gNHgKZWxlY3RyaWNhbCBzbG90IG9mIGEgWDU3MCBjaGlwc2V0IG1vdGhlcmJvYXJkIHdp
dGggYSBSeXplbiAzNzAwWCBDUFUuClRoZSBoYXJkd2FyZSB3b3JrcyBmaW5lIGFuZCBpcyBzdGFi
bGUgdW5kZXIgV2luZG93cyAodGVzdGVkIHdpdGgKZ2FtZXMsIGJlbmNobWFya3MsIHN0cmVzcy10
ZXN0cywgLi4uKQoKQnV0IHdoZW4gdHJ5aW5nIGZvciBpbnN0YW5jZSBzdGVhbSB1bmRlciBsaW51
eCwgb3IgZXZlbiBqdXN0IHRoZSAnYXBwCmxhdW5jaGVyJyBmcm9tIHVidW50dSB0aGF0IGhhcyBz
b21lIHZpc3VhbCBlZmZlY3QsIHRoZSBtYWNoaW5lIHdpbGwKaW5zdGFudGx5IHJlYm9vdC4KQWxz
bywgYWZ0ZXIgdGhlIHJlYm9vdCwgdGhlIEdQVSBpcyBubyBsb25nZXIgZGV0ZWN0ZWQgKGxzcGNp
IGRvZXNuJ3QKc2hvdyBpdCwgYW5kIHVuZGVyIHdpbmRvd3MsIGl0cyBubyB3aGVyZSB0byBiZSBz
ZWVuIGVpdGhlcikuIEl0IG5lZWRzCnRvIGJlIHBoeXNpY2FsbHkgdHVybmVkIG9mZiBhbmQgdHVy
bmVkIGJhY2sgb24gZm9yIGl0IHRvIHdvcmsgYWdhaW4uCgpJIGFkZGVkIGEgc2VyaWFsIGNvbnNv
bGUgdG8gdHJ5IHRvIGdldCBzb21lIG91dHB1dCBhbmQgd2hlbiBkb2luZyB0aGF0Cml0IGRvZXNu
J3QgaW1tZWRpYXRlbHkgcmVib290IChidXQgdGhlIHJlc3QgaXMgdGhlIHNhbWUsIG1hY2hpbmUg
aXMKdW51c2FibGUgYW5kIGEgcmVib290IHdpbGwgaGF2ZSB0aGUgR1BVIG5vdCBwcmVzZW50IGFu
eW1vcmUgdW50aWwKcG93ZXJvZmYpLgoKVGhpcyBpcyB0aGUgb3V0cHV0IEkgZ2V0IDoKClsgIDE0
NC4zMTE3MDRdIGFtZGdwdSAwMDAwOjA2OjAwLjA6IEFNRC1WaTogRXZlbnQgbG9nZ2VkCltJT19Q
QUdFX0ZBVUxUIGRvbWFpbj0weDAwMDAgYWRkcmVzcz0weGEwNzYwMTAxMDAgZmxhZ3M9MHgwMDEw
XQpbICAxNDQuMzIyNzM0XSBhbWRncHUgMDAwMDowNjowMC4wOiBBTUQtVmk6IEV2ZW50IGxvZ2dl
ZApbSU9fUEFHRV9GQVVMVCBkb21haW49MHgwMDAwIGFkZHJlc3M9MHhhMDc2MjMwMTAwIGZsYWdz
PTB4MDAxMF0KWyAgMTQ0LjMzMzc1MV0gYW1kZ3B1IDAwMDA6MDY6MDAuMDogQU1ELVZpOiBFdmVu
dCBsb2dnZWQKW0lPX1BBR0VfRkFVTFQgZG9tYWluPTB4MDAwMCBhZGRyZXNzPTB4YTA3NjAzMDEw
MCBmbGFncz0weDAwMTBdClsgIDE0Ny4wMjg2MjVdIEFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxv
b3AgdGltZWQgb3V0ClsgIDE0Ny4yMDYzMzZdIEFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxvb3Ag
dGltZWQgb3V0ClsgIDE0Ny4zNjgyNjBdIEFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxvb3AgdGlt
ZWQgb3V0ClsgIDE0Ny41MzIyOTZdIEFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxvb3AgdGltZWQg
b3V0ClsgIDE0Ny43MDMyNjldIEFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxvb3AgdGltZWQgb3V0
ClsgIDE0Ny44NDU4NDBdIEFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxvb3AgdGltZWQgb3V0Clsg
IDE0Ny44NjA5NTBdIGlvbW11IGl2aGQwOiBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbSU9UTEJfSU5W
X1RJTUVPVVQKZGV2aWNlPTA2OjAwLjAgYWRkcmVzcz0weDgxYjFjMWU2MF0KWyAgMTQ4LjAxNTc3
OF0gQU1ELVZpOiBDb21wbGV0aW9uLVdhaXQgbG9vcCB0aW1lZCBvdXQKWyAgMTQ4LjE4NzI3MF0g
QU1ELVZpOiBDb21wbGV0aW9uLVdhaXQgbG9vcCB0aW1lZCBvdXQKCihhbmQgdGhlbiBpdCBzZWVt
IHRvIGluZmluaXRlbHkgbG9vcCBhbHdheXMgcHJpbnRpbmcgdGhhdCkuCgpJIHRyaWVkIFVidW50
dSAxOS4xMCB3aXRoIDUuMy4wLTE4LWdlbmVyaWMKQWxzbyBVYnVudHUgMTkuMDQgd2l0aCA1LjAu
MC0zMS1nZW5lcmljCkFsc28gdHJpZWQgd2l0aCBhIERLTVMgbW9kdWxlIGZyb20gMTkuMzAgQU1E
R1BVLVBSTyBwYXRjaGVkIHRvIGJ1aWxkCmFuZCBsb2FkIHVuZGVyIDUuMy4wLCBhbGwgZ2l2ZSB0
aGUgc2FtZSByZXN1bHQuCgpDaGVlcnMsCgogICAgU3lsdmFpbiBNdW5hdXQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

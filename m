Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7BFF888
	for <lists+amd-gfx@lfdr.de>; Sun, 17 Nov 2019 09:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E089A8992E;
	Sun, 17 Nov 2019 08:32:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0-44.i-mecca.net (mx0-44.i-mecca.net [76.74.184.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0555B8992E
 for <amd-gfx@lists.freedesktop.org>; Sun, 17 Nov 2019 08:32:29 +0000 (UTC)
Received: from mx0.ehosting.ca (localhost [127.0.0.1])
 by mx0.i-mecca.net (Postfix) with ESMTP id 51D9E1619CE
 for <amd-gfx@lists.freedesktop.org>; Sun, 17 Nov 2019 00:32:29 -0800 (PST)
Received: from ns14.i-mecca.net (unknown [192.168.1.14])
 by mx0.i-mecca.net (Postfix) with ESMTP id A76171619CD
 for <amd-gfx@lists.freedesktop.org>; Sun, 17 Nov 2019 00:32:28 -0800 (PST)
X-MES: 1.0
Received: from [192.168.51.59] (S010688154406966d.vc.shawcable.net
 [50.64.98.223])
 by ns14.i-mecca.net (Postfix) with ESMTPSA id 78D4614043E
 for <amd-gfx@lists.freedesktop.org>; Sun, 17 Nov 2019 00:32:26 -0800 (PST)
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
From: Luya Tshimbalanga <luya@fedoraproject.org>
Subject: [Follow-Up] Status of AMD Sensor Fusion hub
Organization: Fedora Project
Message-ID: <dee5370f-bd93-cc77-d2db-ab99fa09c0b4@fedoraproject.org>
Date: Sun, 17 Nov 2019 00:32:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-CA
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

SGVsbG8gdGVhbSwKCldoYXQgaXMgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIEFNRCBTZW5zb3VyIEZ1
c2lvbiBodWIgZHJpdmVyIGZvciB0aGUgCkxpbnV4IGtlcm5lbC4gTGFzdCBtb250aCBzdW1tYXJ5
IHdhcyB0aGUgRkNIIHRlYW0gcmVzdHJ1Y3R1cmVkIHRoZSBjb2RlIAphbmQgdGhlIGluaXRpYWwg
aW1wbGVtZW50YXRpb24gc2hvdWxkIGJlIHJlYWR5LgoKSSBsb29rZWQgYXQgdGhlIExpbnV4IElJ
TyBwYXRjaHdvcmsgbWFpbGluZyBsaXN0IFsxXSB0byB0cnkgaXQgYW5kIApwcm92aWRlIGEgZmVl
ZGJhY2sgZm9yIHRoZSBzZW5zb3IgZnVzaW9uIHRvIG5vdCBhdmFpbGFibGUuCgpUaGFua3MgaW4g
YWR2YW5jZSBmb3IgdGhlIHVwZGF0ZS4KCgpSZWZlcmVuY2UKCi0tLS0tLS0tLS0tLS0tLQoKWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1paW8vbGlzdC8KCi0t
IApMdXlhIFRzaGltYmFsYW5nYQpGZWRvcmEgRGVzaWduIFRlYW0KRmVkb3JhIERlc2lnbiBTdWl0
ZSBtYWludGFpbmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

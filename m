Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB315166C98
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Feb 2020 03:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9CC6EE82;
	Fri, 21 Feb 2020 02:04:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1011 seconds by postgrey-1.36 at gabe;
 Fri, 21 Feb 2020 02:04:09 UTC
Received: from spam.moreofthesa.me.uk (moreofthesa.me.uk
 [IPv6:2001:8b0:897:1651::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0E46EE82
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Feb 2020 02:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=moreofthesa.me.uk; s=201708; h=Content-Type:MIME-Version:Message-ID:Subject
 :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xcYm1TfW7l7yOkaU3dYpGf5+7pAcrL7I0CVWLT3yy4g=; b=dHSFc6KNlWrUdXbtT9fJ+kHRvg
 Q3SstcsnMrNgRw1mTFc2WEGIHETGAnO/NOHc+hLRlMegUggXQFzyWDgPoTN7imwKjMj55G+qtOEeZ
 MqEN9M/IeCm43YFBYjq4kwpLmWaFZ5lZrqLxbq17eNfE11vXu4mGk+rk4vmtU73gUvsFZ1Q+xWRaa
 Ugl0slLER1P1tVMzI9rD5wcDCW7bI+jWEZtmyKzjUPx6V31M6/z7ugz338wYjlDW5ibtrqWP7vQqP
 WcCgQbOB40ONb+jeN4BYYj4hICbcpfxKzMffwXfWRapRSv1v7Qy8vaetlMIKCbg3dA0podnn8cY1W
 8ONvH27Q==;
Received: from [2001:8b0:897:1650::2]
 by spam.moreofthesa.me.uk with esmtp (Exim 4.92)
 (envelope-from <devspam@moreofthesa.me.uk>) id 1j4xPP-00069V-BT
 for amd-gfx@lists.freedesktop.org; Fri, 21 Feb 2020 01:47:15 +0000
Date: Fri, 21 Feb 2020 01:45:08 +0000
From: Darren Salt <devspam@moreofthesa.me.uk>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] radeon, amdgpu: allow for symbolic errno output when reporting
 drm_edid_to_sad errors
Message-ID: <584AF8CA80%devspam@moreofthesa.me.uk>
Mail-Followup-To: amd-gfx@lists.freedesktop.org, Darren Salt 
 <devspam@moreofthesa.me.uk>
User-Agent: Messenger-Pro/2.73.6.4250 (Qt/5.11.3) (Linux-x86_64)
X-No-Archive: no
X-Orwell-Date: Fri, 12866 Dec 1984 01:45:08 +0000
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="507152968--1469347429--456175675"
X-SA-Exim-Connect-IP: 2001:8b0:897:1650::2
X-SA-Exim-Mail-From: devspam@moreofthesa.me.uk
X-SA-Exim-Scanned: No (on spam.moreofthesa.me.uk);
 SAEximRunCond expanded to false
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This message is in MIME format.

--507152968--1469347429--456175675
Content-Type: text/plain; charset=us-ascii

This fixes some kernel log text when CONFIG_SYMBOLIC_ERRNAMES=Y.

Signed-off-by: Darren Salt <devspam@moreofthesa.me.uk>

--507152968--1469347429--456175675
Content-Type: application/octet-stream; name="amd-dc-errname.patch"
Content-Disposition: attachment; filename="amd-dc-errname.patch"
Content-Transfer-Encoding: base64

LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYwkyMDIwLTAyLTIx
IDAwOjE3OjQ0LjAwMDAwMDAwMCArMDAwMAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9hdWRpby5jCTIwMjAtMDItMjEgMDE6MTE6MDMuODM1OTkzMjE3ICswMDAwCkBA
IC0zNjgsNyArMzY4LDcgQEAKIAogCXNhZF9jb3VudCA9IGRybV9lZGlkX3RvX3NhZChyYWRl
b25fY29ubmVjdG9yX2VkaWQoY29ubmVjdG9yKSwgJnNhZHMpOwogCWlmIChzYWRfY291bnQg
PCAwKQotCQlEUk1fRVJST1IoIkNvdWxkbid0IHJlYWQgU0FEczogJWRcbiIsIHNhZF9jb3Vu
dCk7CisJCURSTV9FUlJPUigiQ291bGRuJ3QgcmVhZCBTQURzOiAlcGVcbiIsIEVSUl9QVFIo
c2FkX2NvdW50KSk7CiAJaWYgKHNhZF9jb3VudCA8PSAwKQogCQlyZXR1cm47CiAJQlVHX09O
KCFzYWRzKTsKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y4XzAuYwky
MDIwLTAyLTIxIDAwOjE3OjQ0LjAwMDAwMDAwMCArMDAwMAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9kY2VfdjhfMC5jCTIwMjAtMDItMjEgMDE6MTE6MzQuMDc0NTQ1MTE0
ICswMDAwCkBAIC0xMzI0LDcgKzEzMjQsNyBAQAogCiAJc2FkX2NvdW50ID0gZHJtX2VkaWRf
dG9fc2FkKGFtZGdwdV9jb25uZWN0b3JfZWRpZChjb25uZWN0b3IpLCAmc2Fkcyk7CiAJaWYg
KHNhZF9jb3VudCA8IDApCi0JCURSTV9FUlJPUigiQ291bGRuJ3QgcmVhZCBTQURzOiAlZFxu
Iiwgc2FkX2NvdW50KTsKKwkJRFJNX0VSUk9SKCJDb3VsZG4ndCByZWFkIFNBRHM6ICVwZVxu
IiwgRVJSX1BUUihzYWRfY291bnQpKTsKIAlpZiAoc2FkX2NvdW50IDw9IDApCiAJCXJldHVy
bjsKIAlCVUdfT04oIXNhZHMpOwotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9k
Y2VfdjZfMC5jCTIwMjAtMDItMjEgMDA6MTc6NDQuMDAwMDAwMDAwICswMDAwCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92Nl8wLmMJMjAyMC0wMi0yMSAwMToxMTo0
Mi4wMDM2ODk5MzEgKzAwMDAKQEAgLTEyNzUsNyArMTI3NSw3IEBACiAKIAlzYWRfY291bnQg
PSBkcm1fZWRpZF90b19zYWQoYW1kZ3B1X2Nvbm5lY3Rvcl9lZGlkKGNvbm5lY3RvciksICZz
YWRzKTsKIAlpZiAoc2FkX2NvdW50IDwgMCkKLQkJRFJNX0VSUk9SKCJDb3VsZG4ndCByZWFk
IFNBRHM6ICVkXG4iLCBzYWRfY291bnQpOworCQlEUk1fRVJST1IoIkNvdWxkbid0IHJlYWQg
U0FEczogJXBlXG4iLCBFUlJfUFRSKHNhZF9jb3VudCkpOwogCWlmIChzYWRfY291bnQgPD0g
MCkKIAkJcmV0dXJuOwogCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92
MTBfMC5jCTIwMjAtMDItMjEgMDA6MTc6NDQuMDAwMDAwMDAwICswMDAwCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92MTBfMC5jCTIwMjAtMDItMjEgMDE6MTE6MjYu
NDA2NDA1MTAyICswMDAwCkBAIC0xMzcxLDcgKzEzNzEsNyBAQAogCiAJc2FkX2NvdW50ID0g
ZHJtX2VkaWRfdG9fc2FkKGFtZGdwdV9jb25uZWN0b3JfZWRpZChjb25uZWN0b3IpLCAmc2Fk
cyk7CiAJaWYgKHNhZF9jb3VudCA8IDApCi0JCURSTV9FUlJPUigiQ291bGRuJ3QgcmVhZCBT
QURzOiAlZFxuIiwgc2FkX2NvdW50KTsKKwkJRFJNX0VSUk9SKCJDb3VsZG4ndCByZWFkIFNB
RHM6ICVwZVxuIiwgRVJSX1BUUihzYWRfY291bnQpKTsKIAlpZiAoc2FkX2NvdW50IDw9IDAp
CiAJCXJldHVybjsKIAlCVUdfT04oIXNhZHMpOwotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9kY2VfdjExXzAuYwkyMDIwLTAyLTIxIDAwOjE3OjQ0LjAwMDAwMDAwMCArMDAw
MAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjExXzAuYwkyMDIwLTAy
LTIxIDAxOjExOjUzLjE5NDg5NDM5MCArMDAwMApAQCAtMTM5Nyw3ICsxMzk3LDcgQEAKIAog
CXNhZF9jb3VudCA9IGRybV9lZGlkX3RvX3NhZChhbWRncHVfY29ubmVjdG9yX2VkaWQoY29u
bmVjdG9yKSwgJnNhZHMpOwogCWlmIChzYWRfY291bnQgPCAwKQotCQlEUk1fRVJST1IoIkNv
dWxkbid0IHJlYWQgU0FEczogJWRcbiIsIHNhZF9jb3VudCk7CisJCURSTV9FUlJPUigiQ291
bGRuJ3QgcmVhZCBTQURzOiAlcGVcbiIsIEVSUl9QVFIoc2FkX2NvdW50KSk7CiAJaWYgKHNh
ZF9jb3VudCA8PSAwKQogCQlyZXR1cm47CiAJQlVHX09OKCFzYWRzKTsKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCTIw
MjAtMDItMjEgMDA6MTc6NTUuMDAwMDAwMDAwICswMDAwCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwkyMDIwLTAyLTIx
IDAxOjEyOjAyLjM2NzA2MjAyMSArMDAwMApAQCAtOTgsNyArOTgsNyBAQAogCiAJc2FkX2Nv
dW50ID0gZHJtX2VkaWRfdG9fc2FkKChzdHJ1Y3QgZWRpZCAqKSBlZGlkLT5yYXdfZWRpZCwg
JnNhZHMpOwogCWlmIChzYWRfY291bnQgPCAwKQotCQlEUk1fRVJST1IoIkNvdWxkbid0IHJl
YWQgU0FEczogJWRcbiIsIHNhZF9jb3VudCk7CisJCURSTV9FUlJPUigiQ291bGRuJ3QgcmVh
ZCBTQURzOiAlcGVcbiIsIEVSUl9QVFIoc2FkX2NvdW50KSk7CiAJaWYgKHNhZF9jb3VudCA8
PSAwKQogCQlyZXR1cm4gcmVzdWx0OwogCg==

--507152968--1469347429--456175675
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--507152968--1469347429--456175675--

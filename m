Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56BA205B52
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2020 21:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B506EA3C;
	Tue, 23 Jun 2020 19:00:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jun 2020 17:56:09 UTC
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29356EA1D
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2020 17:56:09 +0000 (UTC)
Received: from kirika.xs4all.nl ([62.251.34.220])
 by smtp-cloud9.xs4all.net with ESMTP
 id nn2WjhZHZvh6gnn2Xj2fnn; Tue, 23 Jun 2020 19:48:59 +0200
Received: from localhost (localhost [IPv6:::1])
 by kirika.xs4all.nl (Postfix) with ESMTPS id 7CDE31A401B0
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2020 19:48:56 +0200 (CEST)
Date: Tue, 23 Jun 2020 19:48:56 +0200 (CEST)
From: John van der Kamp <sjonny@suffe.me.uk>
X-X-Sender: sjonny@kirika.lan
To: amd-gfx@lists.freedesktop.org
Subject: Mutex stays locked on error
Message-ID: <alpine.DEB.2.21.2006231945490.3391@kirika.lan>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811583-82272270-1592934536=:3391"
X-CMAE-Envelope: MS4wfDE5h04KZN7Zntb2g3slg5UMZnb360z0zII7u6w4AU0LE65XG+av/FePReOtIROE2LeGpMsdn5t+gPe33/P4IzLGV7+6VqOrljYSAym/EuzIzxFqC0D+
 2vjnuFf57kJGTuTsHB4LaKLY7wbwvcIsRfoppCQ0COInLXb3Eic1x3MGSJk3smEJMpaornY7N737bA==
X-Mailman-Approved-At: Tue, 23 Jun 2020 19:00:18 +0000
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811583-82272270-1592934536=:3391
Content-Type: text/plain; format=flowed; charset=US-ASCII

Hello,

I was reading some code and came across this which looks like a mutex not 
being unlocked when an error happens. I don't know what the code does or 
how to test it, but it looks quite obvious. Patch is attached.

John
---1463811583-82272270-1592934536=:3391
Content-Type: text/x-diff; name=amdgpu_dm_dhcp-mutex_unlock_fix.diff
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.21.2006231948560.3391@kirika.lan>
Content-Description: 
Content-Disposition: attachment; filename=amdgpu_dm_dhcp-mutex_unlock_fix.diff

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX2hkY3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYw0KaW5kZXggZGNm
ODRhNjFkZTM3Li45NDlkMTBlZjgzMDQgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNw
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX2hkY3AuYw0KQEAgLTUxMCw4ICs1MTAsMTAgQEAgc3Rh
dGljIHNzaXplX3Qgc3JtX2RhdGFfcmVhZChzdHJ1Y3QgZmlsZSAqZmlscCwg
c3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBiaW4NCiANCiAJc3JtID0g
cHNwX2dldF9zcm0od29yay0+aGRjcC5jb25maWcucHNwLmhhbmRsZSwgJnNy
bV92ZXJzaW9uLCAmc3JtX3NpemUpOw0KIA0KLQlpZiAoIXNybSkNCi0JCXJl
dHVybiAtRUlOVkFMOw0KKwlpZiAoIXNybSkgew0KKwkJcmV0ID0gLUVJTlZB
TDsNCisJCWdvdG8gcmV0Ow0KKwl9DQogDQogCWlmIChwb3MgPj0gc3JtX3Np
emUpDQogCQlyZXQgPSAwOw0K

---1463811583-82272270-1592934536=:3391
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

---1463811583-82272270-1592934536=:3391--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F9CC234
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 19:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1416E283;
	Fri,  4 Oct 2019 17:56:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF316E283
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 17:56:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j18so7433278wrq.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 04 Oct 2019 10:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:subject:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bQP+J4ZoevbNK2+7uzUUUXN8Xe6GIo6R4W/Jwh6mICA=;
 b=GeIGu+6JDQ6qnQchzAmNwUJZ9rzHKiO5AthugX7RbgOoFAsUNnysNcFeQkw+OC5IKe
 QVU+/M2XOIeZhQCTSZ2HXsqGqSMVl0Y4EHAp+DCG2jwqJJqknb6UG62HHQ61K0d0D+pK
 a80MzWhvtJQJDmWD0/HH3b5KDVpx4qAx0kMOT5vILQQ8Bl6nBxG1kSjSCK+HLaeCjsNi
 VewuDj53CEpJ5zcYjGg2f/pctJb2P0Msi1/atSxtkqDEwFSC6H2OAkkID4CyJ5XKOWET
 PojwZUIlznQoM4mq52AMJBL0Z0nUoxquRgfo95Ek2pFAxgTGVRKS6afGdhWxJfudYa4m
 iecg==
X-Gm-Message-State: APjAAAXSPA9NfzX4o0/aY1v/3J31Z/c4yKYfB88Rq54tktgpbMwE6wz+
 5UOf8uoyvELfwnl9/R3qO7VMdw==
X-Google-Smtp-Source: APXvYqyZ4Y48g0e8yy0GpnleqeNzqjDfmQmZSxCmqPDYo7JW3LgbVk2xnWT5TOPncacyPO+RWrw4MQ==
X-Received: by 2002:a5d:63c6:: with SMTP id c6mr12759122wrw.117.1570211789708; 
 Fri, 04 Oct 2019 10:56:29 -0700 (PDT)
Received: from ?IPv6:2001:470:8afd:2:7069:a655:571c:ee65?
 ([2001:470:8afd:2:7069:a655:571c:ee65])
 by smtp.gmail.com with ESMTPSA id q192sm9821333wme.23.2019.10.04.10.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2019 10:56:29 -0700 (PDT)
To: amd-gfx@lists.freedesktop.org
References: <428588846.275117.1565075113704@mailbusiness.ionos.de>
Subject: Re: Issues with hibernation and resume
From: Andrea Borgia <andrea@borgia.bo.it>
Message-ID: <c77789ee-052b-2705-c367-e107e10a8bff@borgia.bo.it>
Date: Fri, 4 Oct 2019 19:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <428588846.275117.1565075113704@mailbusiness.ionos.de>
Content-Language: it-IT
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=borgia-bo-it.20150623.gappssmtp.com; s=20150623;
 h=to:references:subject:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bQP+J4ZoevbNK2+7uzUUUXN8Xe6GIo6R4W/Jwh6mICA=;
 b=PcLz+is2uwFiG96D9HEGVkE8JjIxchRvnV3sePbHAU1YmCglVPSR8uReEvUZ45aGvg
 Hb+zwJmtpLU2onGw8dQLALDI7scCnBdlX9ILf27czdweQtkBiya3RrKroBMFoEyih5Vc
 JzGg5J2aKo3rgsDgffEt13Wh26GoA5O2c/ZkIj9BX6u0LeZfIVg8EcJc8Elg4WZubMgu
 xkyn0glB/9sPVzM+/DKZZqCvwAEGmlJmtR37G2UpkZ/Eq3THok16ABKLa9DOWGihA/Un
 B7KqU2a2lltUHV+RVRjhqHyaBD9RTgVfQcDYJO3Egh0pk+VyWR5eJrBW65UN3m/wvjqI
 Du8w==
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
Cc: martin.babutzka@online.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TWFydGluIHdyb3RlOgoKPiBEZWFyIEFNRCBEZXZlbG9wZXJzLAo+IEkgYW0gYnVpbGRpbmcgeW91
ciBhbWQtc3RhZ2luZy1kcm0tbmV4dCBrZXJuZWxzIGZvciBtb3JlIHRoYW4gMiB5ZWFycyBub3cg
YW5kIHBhdGNoIHRoaXMgdXAgd2l0aCB0aGUgb2ZmaWNpYWwga2VybmVsIHBhdGNoZXMgYW5kIHVi
dW50dSdzIHNhdWNlIHBhdGNoZXM6IFsxXQo+IE9uZSBvZiB0aGUga2VybmVsIHVzZXJzIHJlcG9y
dHMgYWJvdXQgaGliZXJuYXRpb24gcHJvYmxlbXMgc2luY2UgcXVpdGUgYSB3aGlsZSBhbmQgaGUg
Z2l2ZXMgZGV0YWlsZWQgZmVlZGJhY2sgYnV0IEkgYW0gbm90IGEgaGliZXJuYXRpb24gdXNlciBh
bmQgaGFkIG5vIHRpbWUgdG8gYmlzZWN0IHRoaXMuIENvdWxkIHlvdSBwbGVhc2UgbG9vayBpbnRv
IHRoaXMgaXNzdWUgYW5kIHRyeSB0byBoZWxwOiBbMl0KPiBUaGFua3MgZm9yIHlvdXIgZ3JlYXQg
d29yayBhYm91dCBvcGVuLXNvdXJjZSBsaW51eCBncmFwaGljcyBhbmQga2VlcCBpdCB1cCEKPiBN
YW55IHJlZ2FyZHMsIE1hcnRpbiAoTS1iYWIpCgpIZWxsbywgTWFydGluIGFuZCBhbGwsIHRoYXQg
dXNlciB3b3VsZCBiZSBtZSA6KQoKCk9uY2UgSSBtYW5hZ2VkIHRvIHJlcHJvZHVjZSB0aGUgaXNz
dWUgd2l0aCB0aGUga2VybmVsIGN1cnJlbnRseSBpbiAKRGViaWFuIC8gdGVzdGluZyAoNS4yLjAp
IEkgZmlndXJlZCBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHRyeSBhbmQgYXNrIApmb3IgaGVscCBt
eXNlbGYuCgoKSSdsbCBnaXZlIGEgcXVpY2sgc3VtbWFyeSBoZXJlIHRoZW4gSSBjYW4gYW5zd2Vy
IHJlcXVlc3RzIGZvciBtb3JlIAppbmZvcm1hdGlvbiBpbiBmb2xsb3d1cHM6CgoqIEkgaGF2ZSBh
IFJ5emVuMyAyMjAwRyBvbiBhIERlYmlhbi90ZXN0aW5nIHN5c3RlbSB3aXRoIGEgSERNSSBUViBh
cyAKZGlzcGxheSAvIGF1ZGlvIHNpbmsuCgoqIHVudGlsIGVuZCBvZiBhdWd1c3QsIEkgd2FzIHVz
aW5nIE1hcnRpbidzIDUuMC4xIGtlcm5lbCwgd2l0aCB4ZmNlNCBhcyAKZGVza3RvcCBlbnZpcm9u
bWVudCwgYW5kIEkgY291bGQgaGliZXJuYXRlIGFuZCByZXN1bWUgbXVsdGlwbGUgdGltZXMgCndp
dGggbm8gaXNzdWVzCgoqIGJlZ2lubmluZyByb3VnaGx5IHdpdGggNS4wLjIsIEkgc3RhcnRlZCBy
dW5uaW5nIGludG8gaXNzdWVzIHdpdGggCnBvd2Vyb2ZmIGF0IHRoZSBlbmQgb2YgaGliZXJuYXRp
b24gKG5vdCBoYXBwZW5pbmcpIG9yIGNvcnJ1cHRlZCBncmFwaGljcyAKb24gcmVzdW1lLCBzbyBJ
IHN0dWNrIHdpdGggTWFydGluJ3MgNS4wLjEKCiogb25jZSBJIGdvdCBiYWNrIGZyb20gbXkgaG9s
aWRheXMgYXQgdGhlIGVuZCBvZiBzZXB0ZW1iZXIgYW5kIHVwZ3JhZGVkIAp0aGUgc3lzdGVtLCBJ
IGFsd2F5cyBnZXQgYSBjb3JydXB0ZWQgZ3JlZW5pc2ggZGlzcGxheSB3aGVuIHJlc3VtaW5nLiBJ
ZiAKSSB1c2UgeGZjZTQgSSBnZXQgdGhpcyBncmVlbiBzY3JlZW4gcmlnaHQgYXQgZmlyc3QgbG9n
aW4gKHVubGVzcyBJIGNsZWFyIAp0aGUgY29uZmlnKSwgd2hlcmVhcyB3aXRoIEtERSB0aGUgZmly
c3QgbG9naW4gaXMgdXNhYmxlIGJ1dCBoaWJlcm5hdGUgLyAKcmVzdW1lIGdpdmVzIGEgZ3JlZW4g
c2NyZWVuIChzeXN0ZW0gaXMgcmVhY2hhYmxlIHZpYSBzc2gsIHRob3VnaCkKCiogSSBoYXZlIGNo
ZWNrZWQgYW5kIHJlY2hlY2tlZCB0aGUgSFcgYW5kIGl0IHNlZW1zIHRvIGJlIGZpbmUsIHNpbmNl
IEkgCmNhbiBkdWFsYm9vdCBXaW5kb3dzIGFuZCBpdCBydW5zIGp1c3Qgb2suCgoKCkknbSBub3Qg
c2F5aW5nIGl0IGlzIGEga2VybmVsIGlzc3VlOiBJIHRob3VnaHQgaXQgd2FzIHVudGlsIHRoZSBv
bGQgCnRydXN0eSA1LjAuMSBubyBsb25nZXIgd29ya2VkIGJ1dCBpdCBsb29rcyBsaWtlIHNvbWUg
a2luZCBvZiB3ZWlyZCAKaW50ZXJhY3Rpb24gYmV0d2VlbiBrZXJuZWwgYW5kIChwb3NzaWJseSkg
eHNlcnZlciBhbmQgSSdtIGhvcGluZyB0byBmaW5kIApzb21laGVyZSB3aG8gaGFzIGFscmVhZHkg
ZW5jb3VudGVyZWQgYSBzaW1pbGFyIGlzc3VlIGFuZCBjb3VsZCBwcm92aWRlIApndWlkYW5jZS4K
CgpUaGFua3MsCkFuZHJlYS4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vTS1CYWIvbGludXgta2Vy
bmVsLWFtZGdwdS1iaW5hcmllcwpbMl0gaHR0cHM6Ly9naXRodWIuY29tL00tQmFiL2xpbnV4LWtl
cm5lbC1hbWRncHUtYmluYXJpZXMvaXNzdWVzLzgxCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==

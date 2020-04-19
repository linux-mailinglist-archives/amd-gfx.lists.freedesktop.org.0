Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8041AFE54
	for <lists+amd-gfx@lfdr.de>; Sun, 19 Apr 2020 23:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6874F89A44;
	Sun, 19 Apr 2020 21:12:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Sun, 19 Apr 2020 08:20:57 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8166E42D
 for <amd-gfx@lists.freedesktop.org>; Sun, 19 Apr 2020 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587284455;
 bh=nbpEpWlUW5cjEh1Bv3rGfJegbOGcwEJbutmkmwuZLD4=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=j/78Y+yhGCcdTqmPDfNu8OrVrzEqen7tcX5aj6pxN6caVlB2VKkkmNH1hKhwdx8en
 cFX3wpul6IyM1dNKMpjvGps3YYnt7u68eQBWT6ZCYM/lqZyDZEdeS49wzQCf0lZpD5
 flsMXppWbmsqrJAyZF7DqIooLanPvHd2aEGubC1Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.85.208]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LfAoO-1itGOO45FY-00oo64; Sun, 19
 Apr 2020 10:15:37 +0200
To: Bernard Zhao <bernard@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, =?UTF-8?Q?Felix_K=c3=bchling?=
 <Felix.Kuehling@amd.com>, =?UTF-8?Q?Nicolai_H=c3=a4hnle?=
 <nicolai.haehnle@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Philip Yang <Philip.Yang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Remove an unnecessary null pointer check in
 amdgpu_cs_bo_handles_chunk()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1d0f1eb5-a26f-1739-9222-a39c92ba3024@web.de>
Date: Sun, 19 Apr 2020 10:15:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:wOtp743KJHdMhl10cI6KVRBvss4Fdnb4/BtUFoR9+59x1tK3riY
 mY6nRjszPurBY7UT9LC0WtAwprPBVPF43VElnd8IyX9/aHVMvsuW5B8VAct0H5cO1SH0ajN
 gPSE9DjWrmG19bN+HGYDFczDz44gBXB37NTTj2YHQXNcI7UeY8yANM4zSlvmFsdfSSXGevO
 XduzCkzdsNQO4jjmwBWCg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mLYx3WYCWEY=:XeCvwJRxkvSsXYeTUObxmZ
 0QEiUA3bjjrLtVdRKd6Q16WW70w3UU0lLPMKmzDJt8ZS0JBd7ckGB4du5z0IA95/5NZAYQgXR
 WBrJ1P5zGGvhRmXnYB2wOw8r2BIJolBSmvtGN4x2/eLVyFCUlHatWxisEERi4aLmo8VyiXDCX
 FTiUTIH/Sk7gVV/g3bItDuh7UoiUvoeKGrYcPq4dd2gPOjrwp1MIxecZLDDB1VUasOn7ED1Ru
 xW9RxTTpE2sPhEA5/cd0GKtbRvqYWlmC+XV0WpCugYo/3GwLj95BIrTinCy7+Dq5nOmbIES6M
 ajIDw7/pVldkb/08m3xgDjBF3PmHTFv8Uar4WunIAGCSEcduDhHq8I9I25acm9h8MJXBa/gNr
 YkxQ/dRTtYgs7XUDv8uo3GrblD4ldvb6kcE6zemcUeu/9zRb6U6Z2aEDP2VeIgoUtRT+ug/SG
 b78XttygX/8jdQW5ZwY/R+K4V1TbZLW4ijuuAnaIxriY1dHzGwlKwHrDInva4ohn2NKu5xzLD
 APWKOzCGR1vRl4ahMJs5ndqa1eM6OB1n3rFoC9OX0lRsqFOXkwWCgCzpxIc4AaJ1GKB2aPfv1
 QBJzuZhL95p5/c/ve+AW5C/fx5DnOpTCHAsT75eoXflNMik78NMkwI5Dq/F4gXAN9xmb0zUrB
 M/mg1ACiazcr7/JmFdXa0aLAAncA1Y/KMkfhTLTaeS+ShEelwkadd6DbQcGWg9HEl7sRRE9/4
 6EmtPbu8tpO1kTDLQLSW6PXc32Z491en4oHkuw42shfJlfE6HdmTHeAEvO/tYsmjktLvmlkzG
 W837fZPSMdPdgKo8lRN45CMNBeMQYGYAPVI0BfehtHgwZoXlRgBFq9yKoelgFlZWQeZvi+lsx
 aLN9Ww2aadSroPN57a1e0hb0EO2VudQLDeimrn8EnEt4fbFr7B7T8Iqo0lnX0Vh2R31YHXboI
 NMAPyHIiGohIaADdxA5i/IeiE0uSQmMnuMMf8DZwaPUtHayFvkQS9zw0Fvs6cpzo5pmSvQedC
 6x6UN3nDECXFqMlILZ+4j5is3hFT/12dZqDGSdUarg18BsMkTw2QnnzrF3Rf0jHgq80Q1LXX0
 N5iLwpqwzeX2ASl7acxhvXIxDzp3lF73wZhMB7UmfdiveG3Ro4RfrxnHjXeY30OZNe28AT46u
 YKl4T7L0TQDZYg8lKdgobcnX5kkYyk5+jfdW3SL3H8nSS5EzVO0XFKPMPn8Ijtk1M6pIT58yV
 GrxmJ/X1x/9TndhmA
X-Mailman-Approved-At: Sun, 19 Apr 2020 21:12:16 +0000
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
Cc: David Airlie <airlied@linux.ie>, opensource.kernel@vivo.com,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiBrdmZyZWUgZW5zdXJlIHRoYXQgdGhlIG51bGwgcG9pbnRlciB3aWxsIGRvIG5vdGhpbmcuCgpJ
IHN1Z2dlc3QgdG8gaW1wcm92ZSB0aGUgY29tbWl0IG1lc3NhZ2UuCldvdWxkIHlvdSBsaWtlIHRv
IGFkanVzdCB0aGUgcGF0Y2ggc3ViamVjdD8KCkFyZSB5b3UgbG9va2luZyBmb3IgZnVydGhlciBx
dWVzdGlvbmFibGUgY29uZGl0aW9uIGNoZWNrcz8KCgrigKYKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+IEBAIC05OCw4ICs5OCw3IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2NzX2JvX2hhbmRsZXNfY2h1bmsoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCuKA
pgo+ICsJa3ZmcmVlKGluZm8pOwo+Cj4gIAlyZXR1cm4gcjsKPiAgfQoKSG93IGRvIHlvdSB0aGlu
ayBhYm91dCB0byBvbWl0IGEgYmxhbmsgbGluZSBiZWhpbmQgdGhlIGZ1bmN0aW9uIGNhbGwKYXQg
dGhpcyBzb3VyY2UgY29kZSBwbGFjZT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK

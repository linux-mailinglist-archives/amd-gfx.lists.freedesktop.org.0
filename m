Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95C9DECD
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 09:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D80389938;
	Tue, 27 Aug 2019 07:30:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC92489AB6
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 02:33:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id s18so17172332wrn.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 19:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ukOAyWv6iOe3/h/pGXmzyBdmSXmW1t+h0R6LjGKZGdA=;
 b=iI/tLJnz+R8EZmnnr4cCtz5LtrGeKsBKkcT+FaUQm8Z/zoTxNnsAZK3AvHjIqet4Oq
 fHsb1PbYWFOjyAvwhyRvEZIRiJIx4vovha8q0KUGloXFkFuqmWByUZJhdRrD1Os1AbA4
 Nnl3cuSZv/j10qEtnKGQhSsiURKnOKQB6z8YSr1xBEuMtIFSCeHZQpQmUDDsAd0p2G2Y
 jcVuspDpT23EMkClBH4fr+MiACqoOJbzajgaLGlWbI5H3n0qC7C4XIFhYfXM1/tIXulW
 x0q96YcpznTkmjyJtkXvvlXiHh3faOGoE/Mg94dyzdBV4J6lxDCDXoB7fwJkw3BQnN52
 k/zQ==
X-Gm-Message-State: APjAAAVlsl9cur2UMPLZGlOZ+YpEH2QrSi4zDiLv0itZLxpWzXG/9XAH
 gC50W5ULJSRwsjaXhRMUrTZDYY5z
X-Google-Smtp-Source: APXvYqxm3JOAo9nDfj35RS4NsYGvMPM940uUthsWMJlVtslKIPSdjqSrPkNWhpBWzB9UgMQON69Teg==
X-Received: by 2002:a5d:470c:: with SMTP id y12mr25787346wrq.136.1566873181739; 
 Mon, 26 Aug 2019 19:33:01 -0700 (PDT)
Received: from kontron.lan
 (2001-1ae9-0ff1-f191-1960-e7ae-d7f1-0398.ip6.tmcz.cz.
 [2001:1ae9:ff1:f191:1960:e7ae:d7f1:398])
 by smtp.gmail.com with ESMTPSA id f18sm11229923wrx.85.2019.08.26.19.33.00
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 19:33:00 -0700 (PDT)
To: amd-gfx@lists.freedesktop.org
From: Petr Cvek <petrcvekcz@gmail.com>
Subject: [RFC] AMD polaris MEM_AP_SIZE location (PCI BAR aperture size)
Message-ID: <b5ce72c4-850d-1024-354c-2542045b8992@gmail.com>
Date: Tue, 27 Aug 2019 04:36:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ukOAyWv6iOe3/h/pGXmzyBdmSXmW1t+h0R6LjGKZGdA=;
 b=WxzjsVcwvpRX+dAAqZKV0eBXHI4PSnvu8uNt1QcYfVovMjXh0T7dt8/JeETycbp9KC
 NxoIC3E2vVXyWQVfg0p9Wv+QA+eb63R9O3qNKhaehgtsnF12JkBrsiopvV9u6SWWTfMp
 7BxtJpQJTgfRC/lwtG8tvXczd7ukTY9h9z7sfcuG/rOCLm/vUqwLMpQi9BlSKrScGTgF
 FBwCyR1L0UQKnP9CH05UUb8FwvdV0+h4Ib0zNGjveYuRyvKo37RdQVdIZtAZldnWd7dv
 p0syvI2J9M7e81NvkYqJLpENcBcTDcTcFe1J4cMgwq0ADkpnhf+CiJ4UObXg2CX5zbOI
 T/QA==
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

SGVsbG8sCgpJJ20gdHJ5aW5nIHRvIHJ1biBBTUQgR1BVcyBpbiB1bnVzdWFsIGNvbmZpZ3VyYXRp
b25zLiBJIHdhcyBhYmxlIHRvIGRlY3JlYXNlIHRoZSBQQ0kgQkFSIHNpemUgaW4gSEQ0NTUwIGJ5
IGl0cyBCSU9TIHN0cmFwIGNvbmZpZ3VyYXRpb24gYW5kIGNoYW5nZSBpdCB0byA2NE1CIChhbmQg
SSB3YXMgYWJsZSB0byBydW4gaXQgb24gTUlQUyB2b2NvcmUyIGJvYXJkIDotRCApLiBJcyB0aGVy
ZSBhIHNpbWlsYXIgY29uZmlndXJhdGlvbiBsb2NhdGlvbiBmb3IgQU1EIHBvbGFyaXMgMTEvUlgg
NDYwIEJJT1M/IAoKUGV0ciBDdmVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==

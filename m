Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C29C812
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 05:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE7B6E170;
	Mon, 26 Aug 2019 03:55:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68826E170
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 03:55:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KF6KGFsUhUaZbMOULLye/57y120bInkOnaXF9A5RC8Ix6DxX1VFXUgAQP84Nh94aYubrEvqr6CxsIcw1ZMs8TMlWs5+bN8Y9Xc8fAphePhOC7mIaBdvuQdwQeaw5lqc1/74765+JnBV5CXVckx3PoohRReYTHqpJlyLVyxEsYaqXHSyEBsTIjae8+8FPZF7taCDgufipBBv6VVNkCRRyH4kGlcLa6s5ecdFXzZubQcLcXXXd8YQ60yyn1n2THGIOTyaKlopz5WrWSfBBn0zjNVzJhPEDcsTz26I+0a7eWsRK4kIpdFDA54IsUnioT2jHp4h1kEi7Fph8EXhztFE9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2UxlyQzHHsoT5i32ADcZK81bi+bB8tL3/bZANQBEl0=;
 b=W7MH7//4EoFf4qwQ2khd82EJlgytUziW6rY/I6B2qcTz50ZIy9C3zUnsZHR69szuXEZ6qXnR5E0MZYkEPovgVIE1ibiqNQ0SA/92oB8VaTJYbhewpgHx4bYyqUS+/b8LGeRm9DjujQO37oOAamDZo4WSufhx/FiWFsnHJAuBTy2zzM9zZJzvrJQsiB4Ow+jjtlhKHUXfgtpUrLipMIW38Hh6XdGzNPJYTpjJZ5USHDM5ULDDUpKs/UArdeqxO2P/8l/4jPoI5MySoeUUWsmYJvGgloTB43Kh6JmppUQD24Oj3Qe3G+ZkpzdL1Nbz17UrPwwxVRxf3ULiso5EKisCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:610:57::16)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:70::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Mon, 26 Aug
 2019 03:55:28 +0000
Received: from DM3NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by CH2PR12CA0006.outlook.office365.com
 (2603:10b6:610:57::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 03:55:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT012.mail.protection.outlook.com (10.152.82.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 03:55:27 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Sun, 25 Aug 2019 22:55:26 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 4/8] drm/amdgpu: add nbif v7_4 irq source header for vega20
Date: Mon, 26 Aug 2019 11:54:56 +0800
Message-ID: <1566791700-1912-5-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(186003)(26005)(478600001)(14444005)(336012)(426003)(53416004)(5660300002)(126002)(486006)(476003)(2616005)(11346002)(446003)(47776003)(70206006)(2906002)(70586007)(6666004)(356004)(36756003)(76176011)(51416003)(7696005)(48376002)(8676002)(16586007)(50466002)(6636002)(81166006)(81156014)(4326008)(305945005)(8936002)(53936002)(110136005)(86362001)(316002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3834271e-8c6c-4dc1-1b68-08d729d93b80
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2718; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2718B5570BA4EFBE0D8F6F9EFCA10@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jKcKuOVKaLG1EBrHWiVBT9E1zzN8zfUH8sGedxu1CYIQpnyS6b4jF4jMtr88M4JUbWOTSUwrWxshXmxmPu1CR8ImHpqsuImXuevtUeUsbUSFq98BSOx60rGpM55IHj86UdZwByolQAxTzPrkzB5aEJLtJ+Yc1eJlJPOA3/jONh2mFfHijpgYtGv1ms0wqlyVpwVWkzyooI4vnVnpSnN1krybpv6U3GR3Bunl4Q8x84gu+thxZcxGBipSXnjCAZ2di+dKudZEMeXVOb4E8WIXEC+lX0Vivy3c0k2AMot7xXnDZ19owI3alR9B6WCl8AdWxOZjlrw1fslU/669T0B8+TG6AzdP+An24yP/YvUpLS9o8AqAqWLz4jOjPQPrEbpLKCz//Oq/iBuCUAReOjHbKX99iz16XPw3MQh4KSkMZ4o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 03:55:27.7265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3834271e-8c6c-4dc1-1b68-08d729d93b80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2UxlyQzHHsoT5i32ADcZK81bi+bB8tL3/bZANQBEl0=;
 b=Aeaq6JN0Fw99gnN8OxRTWKaH3+1I6GCx3htwNQluc4xyLC+nRvxLuO0Vss2yPDODhVt/mP4THL4ecLY0QhI5cBicVrwoFFqwlrJDpno8HS6QnrtnxTJDgp7INFYuuRxeawS7XvXGKI07SDXJMm9Mn1Ica6PiIMkAB2cdRHN2bTw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

bmJpZiB2N180IGludGVycnVwdCBzb3VyY2UgZGVmaW5pdGlvbgoKU2lnbmVkLW9mZi1ieTogSGF3
a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9hbWQvaW5jbHVkZS9pdnNy
Y2lkL25iaW8vaXJxc3Jjc19uYmlmXzdfNC5oICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvaXZzcmNpZC9uYmlvL2lycXNyY3NfbmJpZl83XzQu
aAoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9pdnNyY2lkL25iaW8v
aXJxc3Jjc19uYmlmXzdfNC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2l2c3JjaWQv
bmJpby9pcnFzcmNzX25iaWZfN180LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MC4uNzlhZjQyNQotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVk
ZS9pdnNyY2lkL25iaW8vaXJxc3Jjc19uYmlmXzdfNC5oCkBAIC0wLDAgKzEsNDIgQEAKKy8qCisg
KiBDb3B5cmlnaHQgMjAxOSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCisgKgorICogUGVy
bWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24g
b2J0YWluaW5nIGEKKyAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1
bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksCisgKiB0byBkZWFsIGluIHRoZSBTb2Z0
d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCisg
KiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJp
YnV0ZSwgc3VibGljZW5zZSwKKyAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUs
IGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQorICogU29mdHdhcmUgaXMgZnVybmlz
aGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyAqCisg
KiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBz
aGFsbCBiZSBpbmNsdWRlZCBpbgorICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9u
cyBvZiB0aGUgU29mdHdhcmUuCisgKgorICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJ
UyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyAqIElNUExJRUQs
IElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRB
QklMSVRZLAorICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJ
TkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMCisgKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBP
UiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IKKyAqIE9USEVS
IExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RI
RVJXSVNFLAorICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRI
RSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SCisgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdB
UkUuCisgKgorICogQXV0aG9yczogQU1ECisgKgorICovCisKKyNpZm5kZWYgX19JUlFTUkNTX05C
SUZfN180X0hfXworI2RlZmluZSBfX0lSUVNSQ1NfTkJJRl83XzRfSF9fCisKKyNkZWZpbmUgTkJJ
Rl83XzRfX1NSQ0lEX19DSElQX0VSUl9JTlRfRVZFTlQgICAgICAgICAgICAweDVFICAgICAgICAv
LyBFcnJvciBnZW5lcmF0ZWQKKyNkZWZpbmUgTkJJRl83XzRfX1NSQ0lEX19ET09SQkVMTF9JTlRF
UlJVUFQgICAgICAgICAgICAweDVGICAgICAgICAvLyBJbnRlcnJ1cHQgZm9yIGRvb3JiZWxsIGV2
ZW50IGR1cmluZyBWRERHRlggb2ZmCisjZGVmaW5lIE5CSUZfN180X19TUkNJRF9fUkFTX0NPTlRS
T0xMRVJfSU5URVJSVVBUICAgICAgMHg2MCAgICAgICAgLy8gSW50ZXJydXB0IGZvciByYXNfaW50
cl92YWxpZCBmcm9tIFJBUyBjb250cm9sbGVyCisjZGVmaW5lIE5CSUZfN180X19TUkNJRF9fRVJS
RVZFTlRfQVRIVUJfSU5URVJSVVBUICAgICAgMHg2MSAgICAgICAgLy8gSW50ZXJydXB0IGZvciBT
RFAgRXJyRXZlbnQgcmVjZWl2ZWQgZnJvbSBBVEhVQgorI2RlZmluZSBOQklGXzdfNF9fU1JDSURf
X1BGX1ZGX01TR0JVRl9WQUxJRCAgICAgICAgICAgIDB4ODcgICAgICAgIC8vIFZhbGlkIG1lc3Nh
Z2UgaW4gUEYtPlZGIG1haWxib3ggbWVzc2FnZSBidWZmZXIgKFRoZSBpbnRlcnJ1cHQgaXMgc2Vu
dCBvbiBiZWhhbGYgb2YgUEYpCisjZGVmaW5lIE5CSUZfN180X19TUkNJRF9fUEZfVkZfTVNHQlVG
X0FDSyAgICAgICAgICAgICAgMHg4OCAgICAgICAgLy8gQWNrbm93bGVkZ2UgbWVzc2FnZSBpbiBQ
Ri0+VkYgbWFpbGJveCBtZXNzYWdlIGJ1ZmZlciAoVGhlIGludGVycnVwdCBpcyBzZW50IG9uIGJl
aGFsZiBvZiBWRikKKyNkZWZpbmUgTkJJRl83XzRfX1NSQ0lEX19WRl9QRl9NU0dCVUZfVkFMSUQg
ICAgICAgICAgICAweDg5ICAgICAgICAvLyBWYWxpZCBtZXNzYWdlIGluIFZGLT5QRiBtYWlsYm94
IG1lc3NhZ2UgYnVmZmVyIChUaGUgaW50ZXJydXB0IGlzIHNlbnQgb24gYmVoYWxmIG9mIFZGKQor
I2RlZmluZSBOQklGXzdfNF9fU1JDSURfX1ZGX1BGX01TR0JVRl9BQ0sgICAgICAgICAgICAgIDB4
OEEgICAgICAgIC8vIEFja25vd2xlZGdlIG1lc3NhZ2UgaW4gVkYtPlBGIG1haWxib3ggbWVzc2Fn
ZSBidWZmZXIgKFRoZSBpbnRlcnJ1cHQgaXMgc2VudCBvbiBiZWhhbGYgb2YgUEYpCisjZGVmaW5l
IE5CSUZfN180X19TUkNJRF9fQ0hJUF9EUEFfSU5UX0VWRU5UICAgICAgICAgICAgMHhBMCAgICAg
ICAgLy8gQklGX0NISVBfRFBBX0lOVF9FVkVOVAorI2RlZmluZSBOQklGXzdfNF9fU1JDSURfX0NI
SVBfU0xPVF9QT1dFUl9DSEdfSU5UX0VWRU5UIDB4QTEgICAgICAgIC8vIEJJRl9DSElQX1NMT1Rf
UE9XRVJfQ0hHX0lOVF9FVkVOVAorI2RlZmluZSBOQklGXzdfNF9fU1JDSURfX0FUT01JQ19VUl9P
UENPREUgICAgICAgICAgICAgIDB4Q0UgICAgICAgIC8vIEJJRiByZWNlaXZlcyB1bnN1cHBvcnRl
ZCBhdG9taWMgb3Bjb2RlIGZyb20gTUMKKyNkZWZpbmUgTkJJRl83XzRfX1NSQ0lEX19BVE9NSUNf
UkVRRVNURVJFTl9MT1cgICAgICAgICAweENGICAgICAgICAvLyBCSUYgcmVjZWl2ZSBhdG9taWMg
cmVxdWVzdCBmcm9tIE1DIHdoaWxlIEF0b21pY09wIFJlcXVlc3RlciBpcyBub3QgZW5hYmxlZCBp
biBQQ0lFIGNvbmZpZyBzcGFjZQorCisjZW5kaWYgLy8gX19JUlFTUkNTX05CSUZfN180X0hfXwot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65CD9C80F
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 05:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E0C89A86;
	Mon, 26 Aug 2019 03:55:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720056.outbound.protection.outlook.com [40.107.72.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BA089A86
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 03:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxPlW4sFkNUCwHFSyiazGJ3RBCVgpRr73cFoyjf3evV5qXADQP8xaFkth778ajDDrqxA4ER6qM4zmgJyiIUM7dBHBZgA4MIQB6tZNu/EcQE/TtP8JV9sF0IVIhI+bz2UAcjLqkN6Ea5SzFGKth8t+pSDIKNMe5ZdFBIRGPmyLmLo/fc+1YAorKM/6HB7srIakzSj3/5DhJXOodM2OskuMvtWhzegO0QY9AqTNTLnH1DHPIrtgzvQ2gpsUohjMWiNLL4fISluaBJp9LUXEp5Vf03bFrYTBU2TY9BoUXosFPobBjSi8995e7SOzNQbiAs0JKEigqXLTbn5zCiJlfzkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ+ssuW9dIbqIDc3U6LRhuPCD+P7jn19B4w4dyUDgBY=;
 b=PdzXrXX+DCaDZAbeXVLE57f1HXSEMvA0CFxA6o2gU6DlD637En+ipFr1OOoUZ4t2VdRdqPlKEE/RTusBHLuTvxMWdrJwnk6dP3UyYnqE1yiM67s62900eiROYqL8GX2MQo5S23F57oykD4sdXI/Y6UmPG7DAUWK7oy9UNq2lk6/sggX0M0B0edqzylKjAaxw6We18tq2sovOU+w1+sA9WySTiSMrL842g0my07zR/1lXDuRgcQ3vC5RXtEAw2F2x+9ZIfu3DxOIkSWsC2xn9L73GL/bC99RYT4IVD7YJKyAiSEW8p2k+QwaFB5UrvCd1Ng36fJiDSGN6SJZxMhPkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0028.namprd12.prod.outlook.com (2603:10b6:301:2::14)
 by SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:70::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Mon, 26 Aug
 2019 03:55:17 +0000
Received: from DM3NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by MWHPR12CA0028.outlook.office365.com
 (2603:10b6:301:2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 03:55:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT042.mail.protection.outlook.com (10.152.83.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 03:55:16 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Sun, 25 Aug 2019 22:55:15 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/8] drm/amdgpu: add new amdgpu nbio header file
Date: Mon, 26 Aug 2019 11:54:53 +0800
Message-ID: <1566791700-1912-2-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(36756003)(81166006)(81156014)(50226002)(50466002)(486006)(48376002)(316002)(7696005)(51416003)(76176011)(336012)(53416004)(6636002)(11346002)(5660300002)(2616005)(126002)(476003)(426003)(2906002)(446003)(86362001)(305945005)(4326008)(47776003)(478600001)(14444005)(186003)(8936002)(70586007)(26005)(16586007)(70206006)(110136005)(356004)(6666004)(8676002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2719; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b47a42e6-f60e-4fd2-c867-08d729d934f5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2719; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27192E3015AC6543E25EEC65FCA10@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wgSeinC6rArsc66H33T1qkYhlwk5YD+ce8oxzjCNReTFqcRPQL1I9RvafTahTxWDblUxcZFPb826JaNiqURJSaPTTbrFK661fWXpFL4zNCqgjCjbrOyWK61KtLhF8tc5xma+pdfmJZMaLDXR1IZnTAGglEDVSmN/dbtfbUcPdM5NXmj8QHW7hftw9Wkt/8MiKI9VJflHI6EXqo0l9+YTuzbne6qWjb7kg1RnjoCyzbN3MJ5BjrMZodNvZ8YSFs8QS+YiePYk+uTPFtYGKTxW8RkC3lMiIa9eRNXniAsXgVW6zC0nLyQgWqLN9hu1tm9IfGQxP+HVT6eRP6+y6i+JQ+LCdP46pIiZFi+EPGvJfO6nK/PteoekGGlVAUCz4KFhRdEenNvE1hpFpQFyPKGEua1va57MLk7xJCUGShzQY6g=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 03:55:16.7614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b47a42e6-f60e-4fd2-c867-08d729d934f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ+ssuW9dIbqIDc3U6LRhuPCD+P7jn19B4w4dyUDgBY=;
 b=HibHSiz3i5bgRTih36IWnZ0n9wKdfrXofUY3raju6RlLGQCJBEwyLP1AZH2bnxbnbl8amhVw/XSGJDuo6CS6yocGPcyOpSKRUfPRTFoRJmFvpyObGmY2ktUbHM4d03Ou4PncjQ88X4eSF5o9xzJgAHjrn06V7CGZf1ySNK+o+HI=
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

TW9yZSBuYmlvIGZ1bmNpdG9uYWxpdGllcyB3aWxsIGJlIGFkZGVkIGFuZCBuYmlvIGNvdWxkCmJl
IHRyZWF0ZWQgYXMgYW4gaXAgYmxvY2sgbGlrZSBnZngvc2RtYS5ldGMKClNpZ25lZC1vZmYtYnk6
IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfbmJpby5oIHwgODcgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaAoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAuLjA1NjM0NzYKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfbmJpby5oCkBAIC0wLDAgKzEsODcgQEAKKy8qCisgKiBDb3B5cmlnaHQgMjAx
OSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCisgKgorICogUGVybWlzc2lvbiBpcyBoZXJl
YnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKKyAq
IGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVz
ICh0aGUgIlNvZnR3YXJlIiksCisgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJl
c3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCisgKiB0aGUgcmlnaHRzIHRv
IHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5z
ZSwKKyAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQg
cGVyc29ucyB0byB3aG9tIHRoZQorICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBz
dWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyAqCisgKiBUaGUgYWJvdmUgY29w
eXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRl
ZCBpbgorICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdh
cmUuCisgKgorICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FS
UkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyAqIElNUExJRUQsIElOQ0xVRElORyBCVVQg
Tk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorICogRklU
TkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5P
IEVWRU5UIFNIQUxMCisgKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUg
TElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IKKyAqIE9USEVSIExJQUJJTElUWSwgV0hF
VEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAorICogQVJJ
U0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBU
SEUgVVNFIE9SCisgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCisgKgorICovCisj
aWZuZGVmIF9fQU1ER1BVX05CSU9fSF9fCisjZGVmaW5lIF9fQU1ER1BVX05CSU9fSF9fCisKKy8q
CisgKiBhbWRncHUgbmJpbyBmdW5jdGlvbnMKKyAqLworc3RydWN0IG5iaW9faGRwX2ZsdXNoX3Jl
ZyB7CisJdTMyIHJlZl9hbmRfbWFza19jcDA7CisJdTMyIHJlZl9hbmRfbWFza19jcDE7CisJdTMy
IHJlZl9hbmRfbWFza19jcDI7CisJdTMyIHJlZl9hbmRfbWFza19jcDM7CisJdTMyIHJlZl9hbmRf
bWFza19jcDQ7CisJdTMyIHJlZl9hbmRfbWFza19jcDU7CisJdTMyIHJlZl9hbmRfbWFza19jcDY7
CisJdTMyIHJlZl9hbmRfbWFza19jcDc7CisJdTMyIHJlZl9hbmRfbWFza19jcDg7CisJdTMyIHJl
Zl9hbmRfbWFza19jcDk7CisJdTMyIHJlZl9hbmRfbWFza19zZG1hMDsKKwl1MzIgcmVmX2FuZF9t
YXNrX3NkbWExOworCXUzMiByZWZfYW5kX21hc2tfc2RtYTI7CisJdTMyIHJlZl9hbmRfbWFza19z
ZG1hMzsKKwl1MzIgcmVmX2FuZF9tYXNrX3NkbWE0OworCXUzMiByZWZfYW5kX21hc2tfc2RtYTU7
CisJdTMyIHJlZl9hbmRfbWFza19zZG1hNjsKKwl1MzIgcmVmX2FuZF9tYXNrX3NkbWE3OworfTsK
Kworc3RydWN0IGFtZGdwdV9uYmlvX2Z1bmNzIHsKKwljb25zdCBzdHJ1Y3QgbmJpb19oZHBfZmx1
c2hfcmVnICpoZHBfZmx1c2hfcmVnOworCXUzMiAoKmdldF9oZHBfZmx1c2hfcmVxX29mZnNldCko
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOworCXUzMiAoKmdldF9oZHBfZmx1c2hfZG9uZV9v
ZmZzZXQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwl1MzIgKCpnZXRfcGNpZV9pbmRl
eF9vZmZzZXQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwl1MzIgKCpnZXRfcGNpZV9k
YXRhX29mZnNldCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOworCXUzMiAoKmdldF9yZXZf
aWQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwl2b2lkICgqbWNfYWNjZXNzX2VuYWJs
ZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgZW5hYmxlKTsKKwl2b2lkICgqaGRw
X2ZsdXNoKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nKTsKKwl1MzIgKCpnZXRfbWVtc2l6ZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwor
CXZvaWQgKCpzZG1hX2Rvb3JiZWxsX3JhbmdlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwg
aW50IGluc3RhbmNlLAorCQkJYm9vbCB1c2VfZG9vcmJlbGwsIGludCBkb29yYmVsbF9pbmRleCwg
aW50IGRvb3JiZWxsX3NpemUpOworCXZvaWQgKCp2Y25fZG9vcmJlbGxfcmFuZ2UpKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCBib29sIHVzZV9kb29yYmVsbCwKKwkJCQkgICBpbnQgZG9vcmJl
bGxfaW5kZXgsIGludCBpbnN0YW5jZSk7CisJdm9pZCAoKmVuYWJsZV9kb29yYmVsbF9hcGVydHVy
ZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJCSBib29sIGVuYWJsZSk7CisJdm9p
ZCAoKmVuYWJsZV9kb29yYmVsbF9zZWxmcmluZ19hcGVydHVyZSkoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCisJCQkJCQkgIGJvb2wgZW5hYmxlKTsKKwl2b2lkICgqaWhfZG9vcmJlbGxfcmFu
Z2UpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCSAgYm9vbCB1c2VfZG9vcmJlbGws
IGludCBkb29yYmVsbF9pbmRleCk7CisJdm9pZCAoKnVwZGF0ZV9tZWRpdW1fZ3JhaW5fY2xvY2tf
Z2F0aW5nKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQkJCSBib29sIGVuYWJsZSk7
CisJdm9pZCAoKnVwZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXApKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAorCQkJCQkJYm9vbCBlbmFibGUpOworCXZvaWQgKCpnZXRfY2xvY2tnYXRp
bmdfc3RhdGUpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCSAgICAgIHUzMiAqZmxh
Z3MpOworCXZvaWQgKCppaF9jb250cm9sKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CisJ
dm9pZCAoKmluaXRfcmVnaXN0ZXJzKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CisJdm9p
ZCAoKmRldGVjdF9od192aXJ0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CisJdm9pZCAo
KnJlbWFwX2hkcF9yZWdpc3RlcnMpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKK307CisK
K3N0cnVjdCBhbWRncHVfbmJpbyB7CisJY29uc3Qgc3RydWN0IG5iaW9faGRwX2ZsdXNoX3JlZyAq
aGRwX2ZsdXNoX3JlZzsKKwljb25zdCBzdHJ1Y3QgYW1kZ3B1X25iaW9fZnVuY3MgKmZ1bmNzOwor
fTsKKworI2VuZGlmCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
